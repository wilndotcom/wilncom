<?php
/* Smarty version 4.5.3, created on 2025-12-13 00:03:38
  from 'C:\xampp\htdocs\wilncom\ui\ui\widget\info_payment_gateway.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_693c4aea0cc824_85906446',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '325fd3b0bfba7a98c8b7ea91ceafd18d9ca715ac' => 
    array (
      0 => 'C:\\xampp\\htdocs\\wilncom\\ui\\ui\\widget\\info_payment_gateway.tpl',
      1 => 1763396386,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_693c4aea0cc824_85906446 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="panel panel-success panel-hovered mb20 activities">
    <div class="panel-heading"><?php echo Lang::T('Payment Gateway');?>
: <?php echo str_replace(',',', ',$_smarty_tpl->tpl_vars['_c']->value['payment_gateway']);?>

    </div>
</div><?php }
}
