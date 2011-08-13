name "load-balancer"
description "Load Balancer based on HAproxy." 
run_list(
  "role[base]",
  "recipe[haproxy]"
)
override_attributes(
  "haproxy" => {
    "app_server_role" => "webserver"
  }
)