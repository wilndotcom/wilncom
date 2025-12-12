<?php
/* Smarty version 4.5.3, created on 2025-12-13 00:03:22
  from 'C:\xampp\htdocs\wilncom\ui\ui\admin\admin\login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_693c4adaeb33c9_13267638',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '71477f42c6100f1a888833728cd07ab5dde5eeca' => 
    array (
      0 => 'C:\\xampp\\htdocs\\wilncom\\ui\\ui\\admin\\admin\\login.tpl',
      1 => 1763396386,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_693c4adaeb33c9_13267638 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title><?php echo Lang::T('Login');?>
 - <?php echo $_smarty_tpl->tpl_vars['_c']->value['CompanyName'];?>
</title>
    <link rel="shortcut icon" href="<?php echo $_smarty_tpl->tpl_vars['app_url']->value;?>
/ui/ui/images/logo.png" type="image/x-icon" />

    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['app_url']->value;?>
/ui/ui/styles/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['app_url']->value;?>
/ui/ui/styles/modern-AdminLTE.min.css">

    <style>
        .login-box-body {
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .login-box-msg {
            margin-bottom: 20px;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn {
            margin-bottom: 20px;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <?php echo $_smarty_tpl->tpl_vars['_c']->value['CompanyName'];?>

        </div>
        <div class="login-box-body">
            <p class="login-box-msg"><?php echo Lang::T('Enter Admin Area');?>
</p>
            <?php if ((isset($_smarty_tpl->tpl_vars['notify']->value))) {?>
                <?php echo $_smarty_tpl->tpl_vars['notify']->value;?>

            <?php }?>
            <form action="<?php echo Text::url('admin/post');?>
" method="post">
                <input type="hidden" name="csrf_token" value="<?php echo $_smarty_tpl->tpl_vars['csrf_token']->value;?>
">
                <div class="form-group has-feedback">
                    <input type="text" required class="form-control" name="username" placeholder="<?php echo Lang::T('Username');?>
">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" required class="form-control" name="password" placeholder="<?php echo Lang::T('Password');?>
">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <button type="submit" class="btn btn-primary btn-block btn-flat"><?php echo Lang::T('Login');?>
</button>
                <a href="<?php echo Text::url('login');?>
" class="back-link"><?php echo Lang::T('Go Back');?>
</a>
            </form>
        </div>
    </div>
</body>

</html>
<?php }
}
