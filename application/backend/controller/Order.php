<?php
namespace app\backend\controller;
use lib\dashboard;
use think\Controller;

class Order extends Controller
{
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
        echo 11;
    }


}