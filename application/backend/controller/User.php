<?php
namespace app\backend\controller;
use lib\dashboard;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use think\Controller;
use think\db\Where;
use think\Validate;
use think\Request;
use app\Model\Permission;
use PHPExcel_IOFactory;
use PHPExcel;

class User extends Controller
{
    //登录中间件
    protected $middleware = [
        'check' => ['except' => ['login', 'register','loginCheck','registerCheck','logout']],
    ];

    public $session;
    public function __construct()
    {
        parent::__construct();
       $this->user = new \app\Model\User();
        if (!session_id()) session_start();

        $dashboard = new dashboard();
        $dashboard->common();

    }


    public function index()
    {
        $user = $this->session;
        return view('./dashboard-list',['user' => $user]);
    }

    public function login()
    {
        return view('./login');
    }

    public function register()
    {
        return view('./register');
    }

    public function registerCheck()
    {
        $name = trim($_REQUEST['name']);
        $password = trim($_REQUEST['password']);

        $validate = new Validate([
            'password'=>'require|confirm',
        ]);

        $data = [
            'user_name' => $name,
            'user_passwd' => base64_encode($password)
        ];

        $user = $this->user->where('user_name', $name)->find();
        if (empty($user)){
            $this->user->create($data);
        }

        $this->redirect('user/login');

    }

    public function loginCheck()
    {
        $name = trim($_REQUEST['name']);
        $password = base64_encode(trim($_REQUEST['password']));

        $user = $this->user->where('user_name', $name)->where('user_passwd', $password)->find();

        if ($user) {
            $_SESSION['user'] = $user;
            $this->redirect('user/index');
        } else {
            $this->redirect('user/login');
        }

    }

    public function logout()
    {
        session_unset();
        $this->redirect('user/login');

    }

    public function lists()
    {
        $user = $this->session;
        $users = $this->user->paginate(2);
        $page = $users->render();

        $data = [
            'keyword' => '',
            'user' => $user,
            'users'=>$users,
            'page' => $page
        ];

        return view('./list',$data);
    }

    public function search()
    {
        $keyword = trim($_REQUEST['keyword']);

        $search_filed = "%{$keyword}%";
        $like = 'like';

        $users = $this->user->whereOr('user_number',$like,$search_filed)
            ->whereOr('user_name',$like,$search_filed)
            ->whereOr('user_realname',$like,$search_filed)
            ->paginate();
        $page = $users->render();
        $data = [
            'keyword' => $keyword,
            'users'=>$users,
            'page' => $page
        ];

        return view('./list',$data);
    }

    public function add()
    {
        $user = $this->session;

        return view('./add',['user'=>$user]);
    }

    public function save()
    {
        $user_number = trim($_REQUEST['user_number']);
        $user_name = trim($_REQUEST['name']);
        $user_email = trim($_REQUEST['email']);
        $user_realname = trim($_REQUEST['user_realname']);
        $user_passd = trim($_REQUEST['psd']);

        $data = [
            'user_number' => $user_number,
            'user_email' => $user_email,
            'user_realname' => $user_realname,
            'user_passwd' => base64_encode($user_passd),
            'user_name' => $user_name,
        ];

        $user = $this->user->where('user_name', $user_name)->find();
        if ($user) {
            $this->redirect('user/add');
        }
        $res = $this->user->create($data);

        if ($res) {
            $this->redirect('user/lists');
        } else {
            $this->redirect('user/add');
        }
    }

    public function edit($id)
    {
        $userd = $this->user->where('id',$id)->find();

        $this->assign('userd',$userd);
        return $this->fetch('./edit');
    }

    public function modify()
    {
        $user_number = trim($_REQUEST['user_number']);
        $user_name = trim($_REQUEST['name']);
        $user_email = trim($_REQUEST['email']);
        $user_realname = trim($_REQUEST['user_realname']);
        $user_passd = trim($_REQUEST['psd']);
        $id = $_REQUEST['id'];

        $data = [
            'user_number' => $user_number,
            'user_email' => $user_email,
            'user_realname' => $user_realname,
            'user_passwd' => base64_encode($user_passd),
            'user_name' => $user_name,
            'id' => $id
        ];

        $user = $this->user->where('user_name', $user_name)->find();
        if ($user) {
            $this->error('修改失败');
            $this->redirect('user/edit',['id'=>$id]);
        }
        $res = $this->user->update($data);

        if ($res) {
            $this->redirect('user/lists');
        } else {
            $this->redirect('user/edit');
        }
    }

    public function delete($id)
    {
        $this->user->destroy($id);

        $this->redirect('user/lists');
    }

    public function export()
    {
        $ids = $_REQUEST['ids'];
        $ids = explode(',', $ids);
        $ids = preg_grep("/\S+/i", $ids); //剔除数组空数据
        $newExcel = new Spreadsheet();
        $objSheet  = $newExcel->getActiveSheet();
        $objSheet->setTitle('管理员表');

        //设置宽度为true
        $newExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $newExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
        $newExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
        $newExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
        $newExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
        $newExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);

        //设置第一栏的标题
        $objSheet->setCellValue('A1', 'id')
            ->setCellValue('B1', '用户名')
            ->setCellValue('C1', '用户编号')
            ->setCellValue('D1', '真实名字')
            ->setCellValue('E1', '邮箱')
            ->setCellValue('F1', '时间');

        if ($ids){
            $users = $this->user->whereIn('id', $ids)->select();
        } else {
            $users = $this->user->select();
        }

        //第二行起，每一行的值,setCellValueExplicit是用来导出文本格式的。
        //->setCellValueExplicit('C' . $k, $val['admin_password']PHPExcel_Cell_DataType::TYPE_STRING),可以用来导出数字不变格式
        foreach ($users as $k => $val) {
            $k = $k + 2;
            $objSheet->setCellValue('A' . $k, $val['id'])
                ->setCellValue('B' . $k, $val['user_name'])
                ->setCellValue('C' . $k, $val['user_number'])
                ->setCellValue('D' . $k, $val['user_realname'])
                ->setCellValue('E' . $k, $val['user_email'])
                ->setCellValue('F' . $k, date('Y-m-d H:i:s', $val['created']));
        }

        $this->downloadExcel($newExcel, '管理员表', 'Xls');
    }

    public function downloadExcel($newExcel, $filename, $format)
    {
        // $format只能为 Xlsx 或 Xls
        if ($format == 'Xlsx') {
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        } elseif ($format == 'Xls') {
            header('Content-Type: application/vnd.ms-excel');
        }

        header("Content-Disposition: attachment;filename=". $filename . date('Y-m-d') . '.' . strtolower($format));
        header('Cache-Control: max-age=0');
        $objWriter = IOFactory::createWriter($newExcel, $format);
        $objWriter->save('php://output');
        $objWriter->save($filename . date('Y-m-d').'.xlsx');
        exit;
    }

}