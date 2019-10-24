<?php
namespace app\Model;
use think\Model;

class Menu extends Model
{
    protected $table = 'tb_menu';

    public function permission()
    {
        return $this->hasMany(Permission::class,'menu_id','id');
    }
}