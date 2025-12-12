<?php

class online_pppoe_users
{
    public function getWidget()
    {
        global $ui, $config;

        // Count PPPoE online users
        $pppoe_online = 0;

        // Check if we need to query Mikrotik devices for online users
        if ($config['check_customer_online'] == 'yes') {
            // Get all active PPPoE plans
            $pppoe_plans = ORM::for_table('tbl_user_recharges')
                ->where('status', 'on')
                ->where('type', 'PPPOE')
                ->find_many();

            foreach ($pppoe_plans as $plan) {
                $customer = ORM::for_table('tbl_customers')->find_one($plan['customer_id']);
                $p = ORM::for_table('tbl_plans')->find_one($plan['plan_id']);

                if ($customer && $p && file_exists($WIDGET_PATH . '/../devices/' . $p['device'] . '.php')) {
                    require_once $WIDGET_PATH . '/../devices/' . $p['device'] . '.php';
                    try {
                        if ((new $p['device'])->online_customer($customer, $plan['routers'])) {
                            $pppoe_online++;
                        }
                    } catch (Exception $e) {
                        // Silent fail if device connection fails
                    }
                }
            }
        }

        $ui->assign('pppoe_online', $pppoe_online);
        return $ui->fetch('widget/online_pppoe_users.tpl');
    }
}