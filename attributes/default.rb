default["base2"]["icinga2"]["pagerduty"]["api_key"] = "x"
default["base2"]["icinga2"]["check_base2"] = true
default["base2"]["icinga2"]["container"]["tag"] = 'v0.1.0'
default["base2"]["icinga2"]["container"]["binds"] = {
  '/data/opt/icinga2/extra' => '/opt/icinga2/extra',
  '/data/icinga2/mysql' => '/var/lib/mysql',
  '/data/icinga2/var/log' => '/var/log/icinga2',

}
