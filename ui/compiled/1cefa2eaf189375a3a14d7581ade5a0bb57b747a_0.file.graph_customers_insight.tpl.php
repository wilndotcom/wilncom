<?php
/* Smarty version 4.5.3, created on 2025-12-13 00:03:39
  from 'C:\xampp\htdocs\wilncom\ui\ui\widget\graph_customers_insight.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_693c4aeb5d3622_27567738',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1cefa2eaf189375a3a14d7581ade5a0bb57b747a' => 
    array (
      0 => 'C:\\xampp\\htdocs\\wilncom\\ui\\ui\\widget\\graph_customers_insight.tpl',
      1 => 1763396386,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_693c4aeb5d3622_27567738 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="panel panel-info panel-hovered mb20 activities">
    <div class="panel-heading"><?php echo Lang::T('All Users Insights');?>
</div>
    <div class="panel-body">
        <canvas id="userRechargesChart"></canvas>
    </div>
</div>


<?php echo '<script'; ?>
 type="text/javascript">
    
        document.addEventListener("DOMContentLoaded", function() {
            // Get the data from PHP and assign it to JavaScript variables
            var u_act = '<?php echo $_smarty_tpl->tpl_vars['u_act']->value;?>
';
            var c_all = '<?php echo $_smarty_tpl->tpl_vars['c_all']->value;?>
';
            var u_all = '<?php echo $_smarty_tpl->tpl_vars['u_all']->value;?>
';
            //lets calculate the inactive users as reported
            var expired = u_all - u_act;
            var inactive = c_all - u_all;
            if (inactive < 0) {
                inactive = 0;
            }
            // Create the chart data
            var data = {
                labels: ['Active Users', 'Expired Users', 'Inactive Users'],
                datasets: [{
                    label: 'User Recharges',
                    data: [parseInt(u_act), parseInt(expired), parseInt(inactive)],
                    backgroundColor: ['rgba(4, 191, 13)', 'rgba(191, 35, 4)', 'rgba(0, 0, 255, 0.5'],
                    borderColor: ['rgba(0, 255, 0, 1)', 'rgba(255, 99, 132, 1)', 'rgba(0, 0, 255, 0.7'],
                    borderWidth: 1
                }]
            };

            // Create chart options
            var options = {
                responsive: true,
                aspectRatio: 1,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            boxWidth: 15
                        }
                    }
                }
            };

            // Get the canvas element and create the chart
            var ctx = document.getElementById('userRechargesChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'pie',
                data: data,
                options: options
            });
        });
    
<?php echo '</script'; ?>
><?php }
}
