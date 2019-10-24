<?php
namespace app\Model;
use think\Model;

class Permission extends Model
{
    protected $table = 'tb_permission';

    public function menu()
    {
        return $this->belongsToMany(Permission::class,'id','menu_id');
    }

    public function user()
    {
        return $this->belongsToMany(User::class,'id','user_id');
    }
}