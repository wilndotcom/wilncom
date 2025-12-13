<?php
/* Smarty version 4.5.3, created on 2025-12-13 19:57:36
  from 'C:\xampp\htdocs\wilncom\ui\ui\widget\online_hotspot_users.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_693d9b008586a8_94173875',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '466979909c63d8a146e2d64ebb86d270bcc3aa74' => 
    array (
      0 => 'C:\\xampp\\htdocs\\wilncom\\ui\\ui\\widget\\online_hotspot_users.tpl',
      1 => 1765575523,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_693d9b008586a8_94173875 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="small-box bg-purple">
    <div class="inner">
        <h4 class="text-bold" style="font-size: large;"><?php echo $_smarty_tpl->tpl_vars['hotspot_online']->value;?>
</h4>
        <p><?php echo Lang::T('Hotspot Online Users');?>
</p>
    </div>
    <div class="icon">
        <i class="ion ion-wifi"></i>
    </div>
    <a href="<?php echo Text::url('plan/list');?>
" class="small-box-footer"><?php echo Lang::T('View Hotspot Plans');?>
 <i class="fa fa-arrow-circle-right"></i></a>
</div><?php }
}
