<?php
/* Smarty version 4.5.3, created on 2025-12-13 19:57:36
  from 'C:\xampp\htdocs\wilncom\ui\ui\widget\online_static_users.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_693d9b00c166b3_88281683',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a45011c968d24283326eae73cdb037f33d79943a' => 
    array (
      0 => 'C:\\xampp\\htdocs\\wilncom\\ui\\ui\\widget\\online_static_users.tpl',
      1 => 1765575523,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_693d9b00c166b3_88281683 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="small-box bg-olive">
    <div class="inner">
        <h4 class="text-bold" style="font-size: large;"><?php echo $_smarty_tpl->tpl_vars['static_online']->value;?>
</h4>
        <p><?php echo Lang::T('Static IP Online Users');?>
</p>
    </div>
    <div class="icon">
        <i class="ion ion-ios-world"></i>
    </div>
    <a href="<?php echo Text::url('plan/list');?>
" class="small-box-footer"><?php echo Lang::T('View Static Plans');?>
 <i class="fa fa-arrow-circle-right"></i></a>
</div><?php }
}
