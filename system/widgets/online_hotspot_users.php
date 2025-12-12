<?php

class online_hotspot_users
{
    public function getWidget()
    {
        global $ui, $config;

        // Count hotspot online users
        $hotspot_online = 0;

        // Check if we need to query Mikrotik devices for online users
        if ($config['check_customer_online'] == 'yes') {
            // Get all active hotspot plans
            $hotspot_plans = ORM::for_table('tbl_user_recharges')
                ->where('status', 'on')
                ->where('type', 'Hotspot')
                ->find_many();

            foreach ($hotspot_plans as $plan) {
                $customer = ORM::for_table('tbl_customers')->find_one($plan['customer_id']);
                $p = ORM::for_table('tbl_plans')->find_one($plan['plan_id']);

                if ($customer && $p && file_exists($WIDGET_PATH . '/../devices/' . $p['device'] . '.php')) {
                    require_once $WIDGET_PATH . '/../devices/' . $p['device'] . '.php';
                    try {
                        if ((new $p['device'])->online_customer($customer, $plan['routers'])) {
                            $hotspot_online++;
                        }
                    } catch (Exception $e) {
                        // Silent fail if device connection fails
                    }
                }
            }
        }

        $ui->assign('hotspot_online', $hotspot_online);
        return $ui->fetch('widget/online_hotspot_users.tpl');
    }
}