name "mac"
description "Configuration & settings applied to Mac nodes."
run_list(
  "role[base]",
  "recipe[chef-client-mac]"
)
override_attributes(
  "chef_client" => {
    "init_style" => "bsd"
  }
)