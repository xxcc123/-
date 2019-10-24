<?php
namespace app\backend\controller;

use app\Model\Goods;
use app\Model\User;
use think\Controller;

class  Api extends Controller{

    public function __construct()
    {

    }

    public function submit()
    {
        $user_name = input('name');
        $password = input('password');

        $data = [
            'code' => 200,
            'username' => $user_name,
            'password' => $password
        ];

        echo  json_encode($data);
    }

    public function goods()
    {
        $goods = Goods::all();

        return json_encode([
            'code' => 200,
            'res' => $goods
        ]);
    }

    public function goods_detail()
    {
        $id = input('id');

        $good = Goods::where('id', $id)->find();

        return json_encode([
            'code' => 200,
            'res' => $good
        ]);
    }

    public function center()
    {
        $name = input('name');

        $user = User::where('user_name',$name)->find();

        return json_encode([
            'code' => 200,
            'res' => $user
        ]);

    }
}