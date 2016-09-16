FROM icinga/icinga2


#icinga2 daemon --validate
#supervisorctl restart icinga2
#RUN yum install -y perl-libwww-perl perl-Crypt-SSLeay perl-Sys-Syslog
#RUN cd /etc/icinga2/conf.d && wget https://raw.githubusercontent.com/mdcollins05/PagerDuty-Icinga2/master/pagerduty-icinga2.conf
RUN yum install -y ruby nagios-plugins-nrpe; mkdir -p /opt/icinga2/extra

RUN yum install -y gettext




COPY services.conf /etc/icinga2/conf.d/services.conf
COPY base2-pagerduty-icinga2.conf /etc/icinga2/conf.d/base2-pagerduty-icinga2.conf
COPY base2icinga2pagerduty.rb /usr/local/bin/base2icinga2pagerduty.rb
COPY include_extra.conf /etc/icinga2/conf.d/include_extra.conf

RUN chmod a+x /usr/local/bin/base2icinga2pagerduty.rb
