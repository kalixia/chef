name "base"
description "Basic configuration applied to all nodes."
run_list(
  "recipe[chef-client::delete_validation]",
  "recipe[chef-client::config]",
  "recipe[chef-client::service]"
  #"recipe[htop]"
  #"recipe[ganglia::node]"
  #"recipe[squid-deb-proxy::client]"
)
#default_attributes(
#  "ganglia" => {
#    "clusterName" => "Kalixia Cluster"
#  }
#)
override_attributes(
  "chef_client" => {
    "server_url" => "http://chef-server.kalixia.com:4000",
    "validation_client_name" => "chef-validator"
  }
)