<?php

class online_static_users
{
    public function getWidget()
    {
        global $ui, $config;

        // Count static IP online users
        $static_online = 0;

        // Check if we need to query Mikrotik devices for online users
        if ($config['check_customer_online'] == 'yes') {
            // Get all active static IP plans
            $static_plans = ORM::for_table('tbl_user_recharges')
                ->where('status', 'on')
                ->where('type', 'Static')
                ->find_many();

            foreach ($static_plans as $plan) {
                $customer = ORM::for_table('tbl_customers')->find_one($plan['customer_id']);
                $p = ORM::for_table('tbl_plans')->find_one($plan['plan_id']);

                if ($customer && $p && file_exists($WIDGET_PATH . '/../devices/' . $p['device'] . '.php')) {
                    require_once $WIDGET_PATH . '/../devices/' . $p['device'] . '.php';
                    try {
                        if ((new $p['device'])->online_customer($customer, $plan['routers'])) {
                            $static_online++;
                        }
                    } catch (Exception $e) {
                        // Silent fail if device connection fails
                    }
                }
            }
        }

        $ui->assign('static_online', $static_online);
        return $ui->fetch('widget/online_static_users.tpl');
    }
}