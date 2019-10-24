<?php
namespace app\backend\controller;
use lib\dashboard;
use think\Controller;
use think\Validate;
use think\Request;

/**
 * 菜单管理
 * Class Menu
 * @package app\backend\controller
 */
class Menu extends Controller
{
    protected $middleware = [
        'check',
    ];

    public function __construct()
    {
        parent::__construct();

        $dashboard = new dashboard();
        $dashboard->common();

        $this->menu = new \app\Model\Menu();
    }

    public function index()
    {
        $code = isset($_REQUEST['code']) ? $_REQUEST['code'] : "";
        $info = isset($_REQUEST['info']) ? $_REQUEST['info'] : "";

        $menus = $this->menu->paginate();
        $page = $menus->render();

        $this->assign('menus', $menus);
        $this->assign('page', $page);
        $this->assign('code',$code);
        $this->assign('info',$info);
        return view('./menu-index');
    }

    public function add()
    {
        $menus = $this->menu->where('parent_menu_id',0)->select();
        $this->assign('menus', $menus);
        return view('./menu-add');
    }

    public function save()
    {
        $menu_name = trim($_REQUEST['menu_name']);
        $menu_id = $_REQUEST['menu_id'];
        $menu_url  = $_REQUEST['menu_url'];

        $menu_data = [
            'menu_name' => $menu_name,
            'parent_menu_id' => $menu_id,
            'created_at' => date('Y-m-d H:i:s'),
            'menu_url' => $menu_url
        ];
        $menu = $this->menu->where('menu_name', $menu_name)->find();

        if (empty($menu)){
            $this->menu->create($menu_data);
            return redirect('menu/index',['info'=>'创建成功','code'=>'success'],302);
        } else{
            return redirect('menu/index',['info'=>'创建失败，菜单名称已存在','code'=>'danger'],302);
        }

    }

    public function edit($id)
    {
        $menu = $this->menu->where('id', $id)->find();

        $menus = $this->menu->where('parent_menu_id',0)->select();

        $this->assign('row',$menu);
        $this->assign('menus',$menus);

        return view('./menu-edit');
    }

    public function modify()
    {
        $id = $_REQUEST['id'];
        $menu_name = trim($_REQUEST['menu_name']);
        $menu_url = trim($_REQUEST['menu_url']);

        $menu = $this->menu->where('menu_name',$menu_name)->find();
        if ($menu) {
            return redirect('menu/index',['info'=>'更新失败，菜单名称已存在','code'=>'danger']);
        }

        $data = [
            'id' => $id,
            'menu_name' => $menu_name,
            'menu_url' => $menu_url,
            'update_time' => date('Y-m-d H:i:s')
        ];

        $res = $this->menu->update($data);
        if ($res){
            $this->redirect('menu/index');
        } else {
            $this->redirect('menu/edit',['id' => $id]);
        }

    }

    public function delete($id)
    {
        $this->menu->destroy($id);

        $this->redirect('menu/index');
    }

}