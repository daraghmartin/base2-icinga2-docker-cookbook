#!/usr/bin/ruby

require 'json'
require 'uri'
require 'net/http'
require 'net/https'

log_file = File.open("/tmp/notifier-#{Time.now.strftime('%Y-%m-%d')}.log", 'a')
log_file.write Time.now.strftime("%d/%m/%Y %H:%M") + "\n"

#host or service?
contactpager = ENV["ICINGA_CONTACTPAGER"]
origin_type = ENV["ICINGA_ORIGIN_TYPE"]
notificationtype = ENV["ICINGA_NOTIFICATIONTYPE"]
state = ENV["ICINGA_STATE"]
output = ENV["ICINGA_OUTPUT"]
servicename = ENV["ICINGA_SERVICENAME"]
host = ENV["ICINGA_HOST"]
hostalias = ENV["ICINGA_HOSTALIAS"]
client = ENV["ICINGA_CLIENT"]

incident_key = "#{client}/#{origin_type}/#{host}"
incident_key = "#{incident_key}/#{servicename}" if origin_type == "service"

#resolve on all but critical
#HOST STATES = UP DOWN
#SERVICE STATES = OK WARNING CRITICAL UNKNOWN

event_type = (["CRITICAL", "DOWN"].include?(state) ? "trigger" : "resolve")

incident = {
      "service_key" =>  contactpager,
      "incident_key" =>  incident_key,
      "event_type" =>  event_type,
      "description" =>  "#{origin_type} FAILURE for #{client} on #{host}",
      "client" =>  client,
      "details" =>  {
        "notificationtype" =>  notificationtype,
        "host" =>  host,
        "hostalias" =>  hostalias,
        "state" =>  state,
        "ouput" =>  output,
        "origin_type" => origin_type,
        "key" => incident_key
      }
}

log_file.write incident.to_json + "\n"
puts incident.to_json

uri_to_parse = "https://events.pagerduty.com/generic/2010-04-15/create_event.json"

uri = URI.parse(uri_to_parse)
https = Net::HTTP.new(uri.host,uri.port)
https.use_ssl = true

req = Net::HTTP::Post.new(
    uri_to_parse,
    initheader = {'Content-Type' =>'application/json'}
)
req.body = incident.to_json
resp = https.request(req)

puts 'Code = ' + resp.code + ' Message = ' + resp.message
resp.each {|key, val| log_file.write key + ' = ' + val + "\n"}
puts resp.body

log_file.write(resp.body)

raise "Bad Query: #{resp.code} #{uri}" unless resp.code == "200"

# incidenv = {
#       "service_key": ICINGA_CONTACTPAGER,
#       "incident_key": "srv01/HTTP",
#       "event_type": "trigger",
#       "description": "FAILURE for production/HTTP on machine srv01.acme.com",
#       "client": "Sample Monitoring Service",
#       "client_url": "https://monitoring.service.com",
#       "details": {
#         "ping time": "1500ms",
#         "load avg": 0.75
#       },
#       "contexts":[
#         {
#           "type": "link",
#           "href": "http://acme.pagerduty.com"
#         },{
#           "type": "link",
#           "href": "http://acme.pagerduty.com",
#           "text": "View the incident on PagerDuty"
#         },{
#           "type": "image",
#           "src": "https://chart.googleapis.com/chart?chs=600x400&chd=t:6,2,9,5,2,5,7,4,8,2,1&cht=lc&chds=a&chxt=y&chm=D,0033FF,0,0,5,1"
#         },{
#           "type": "image",
#           "src": "https://chart.googleapis.com/chart?chs=600x400&chd=t:6,2,9,5,2,5,7,4,8,2,1&cht=lc&chds=a&chxt=y&chm=D,0033FF,0,0,5,1",
#           "href": "https://google.com"
#         }
#       ]
#     }

exit 0
