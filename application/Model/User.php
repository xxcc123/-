<?php
namespace app\Model;
use think\Model;

class User extends Model
{
    protected $table = 'tb_user';

    public function permission()
    {
        return $this->hasMany(Permission::class,'user_id','id');
    }
}