default["base2"]["icinga2"]["pagerduty"]["api_key"] = "x"
default["base2"]["icinga2"]["container"]["tag"] = 'v0.1.0'
default["base2"]["icinga2"]["container"]["bind_dirs"] = ['/data/icinga2/mysql/', '/data/icinga2/conf.d', '/data/opt/base2/icinga2/conf.d']
default["base2"]["icinga2"]["container"]["binds"] = ['/data/icinga2/conf.d:/etc/icinga2/conf.d', '/data/opt/base2/icinga2/conf.d:/opt/base2/icinga2/conf.d' '/data/icinga2/mysql:/var/lib/mysql']
