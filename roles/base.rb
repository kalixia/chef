name "base"
description "Basic configuration applied to all nodes."
run_list(
  "recipe[ntp]",
  "recipe[htop]",
  "recipe[ganglia::node]"
  #"recipe[squid-deb-proxy::client]"
)

default_attributes(
  "ganglia" => {
    "clusterName" => "Kalixia Cluster"
  }
)