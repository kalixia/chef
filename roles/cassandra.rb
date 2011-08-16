name "cassandra"
description "Install Cassandra" 
run_list(
  "recipe[cassandra]"
)
override_attributes(
  "java" => {
    "install_flavor" => "sun"
  }
)