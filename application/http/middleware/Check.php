<?php

namespace app\http\middleware;

use app\Model\Permission;
use lib\dashboard;

class Check
{
    public function handle($request, \Closure $next)
    {
        $this->user = new \app\Model\User();
        if (!session_id()) session_start();

        $this->session = isset($_SESSION['user']) ? $_SESSION['user'] : '';
        if (empty($this->session)) {
            return redirect('user/login');

        }
        return $next($request);

    }
}
