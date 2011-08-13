name "java"
description "Install Sun Java on Ubuntu" 
run_list(
  "recipe[java]"
)
override_attributes(
  "java" => {
    "install_flavor" => "sun"
  }
)