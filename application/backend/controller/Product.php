<?php
namespace app\backend\controller;
use app\Model\Goods;
use lib\dashboard;
use think\Controller;
use traits\controller\Jump;

class Product extends Controller
{
//    use Jump;
    //登录中间件
    protected $middleware = [
        'check',
    ];

    public function __construct()
    {
        parent::__construct();

        $dashboard = new dashboard();
        $dashboard->common();

    }

    public function index()
    {
        $code = isset($_REQUEST['code']) ? $_REQUEST['code'] : "";
        $info = isset($_REQUEST['info']) ? $_REQUEST['info'] : "";
        $products = Goods::paginate();
        $page = $products->render();

        $this->assign('page',$page);
        $this->assign('products',$products);
        $this->assign('code',$code);
        $this->assign('info',$info);
        return view('./goods-index');
    }

    public function add()
    {
        return view('./goods-add');
    }

    public function save()
    {
        $goods_name = trim($_REQUEST['goods_name']);
        $goods_price = trim($_REQUEST['price']);
        $purchase_price = trim($_REQUEST['purchase_price']);
        $goods_stock = trim($_REQUEST['goods_stock']);
    }

    public function category()
    {
        $code = isset($_REQUEST['code']) ? $_REQUEST['code'] : "";
        $info = isset($_REQUEST['info']) ? $_REQUEST['info'] : "";
        $products = Goods::paginate();
        $page = $products->render();

        $this->assign('page',$page);
        $this->assign('products',$products);
        $this->assign('code',$code);
        $this->assign('info',$info);
        return view('./category-index');
    }

    public function images()
    {
        return view('./images');

    }

    public function file_upload()
    {
        $file = request()->file('file');

        $info = $file->validate(['ext' => 'jpg', 'png','gif'])->move('uploads');
        if($info){
            //获取图片的存放相对路径
            $filePath = 'uploads'.$info->getSaveName();
            $getInfo = $info->getInfo();
            //获取图片的原名称
            $name = $getInfo['name'];
            //整理数据,写入数据库
            $data = [
                'path' => $filePath,
                'name' => $name,
                'create_time' => date('Y-m-d H:i:s')
            ];
        }else{
            // 上传失败获取错误信息
            echo $file->getError();
        }
    }


}