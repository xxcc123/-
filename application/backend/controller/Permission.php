<?php
namespace app\backend\controller;
use lib\dashboard;
use think\Controller;
use think\Validate;
use think\Request;
use app\Model\Menu;
use app\Model\User;

/**
 * 权限管理
 * Class Permission
 * @package app\backend\controller
 */
class Permission extends Controller
{
    protected $middleware = [
        'check',
    ];

    public function __construct()
    {
        parent::__construct();

        $this->permission = new \app\Model\Permission();

        $dashboard = new dashboard();
        $dashboard->common();

    }

    public function index()
    {
        $menus = Menu::select();
        $users = User::select();

        $this->assign('data', $menus);
        $this->assign('users', $users);
        return view('./permission-index');
    }

    public function save()
    {

    }

    public function edit($id)
    {
        $menus = Menu::select();

        $permission = $this->permission->where('user_id',$id)->select();

        $this->assign('data', $menus);
        $this->assign('permission', $permission);
        $this->assign('id', $id);
        return view('./permission-list');
    }

    public function modify()
    {
        $id = $_REQUEST['id'];
        $menu_id = $_REQUEST['menu_id'];

        $this->permission->where('user_id', $id)->delete();

        foreach ($menu_id as $val) {
            $data = [
                'user_id' => $id,
                'menu_id' => $val
            ];

            $this->permission->create($data);
        }

        $this->redirect('user/lists');

    }

}