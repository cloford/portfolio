/// @description Insert description here
// You can write your code in this editor


//以下はobj_sys_inventoryとの関わり
drag_item = 0; //つかんでいるitemのid
creator = noone; //creator
edit_to = noone; //編集する対象
drag_ID = 0;   //掴み始めた元の位置（select）
from_equip = false;
clear_start = false; //元居た場所をクリアするフラグ
buying = false;

if(room == rm_shop)
{
	in_shop = true;
}
else
{
	in_shop = false;
}