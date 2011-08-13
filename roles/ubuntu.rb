name "ubuntu"
description "Configuration & settings applied to Ubuntu nodes."
run_list(
  "recipe[apt]",
  "role[base]",
  "recipe[ntp]"
)
override_attributes(
  "chef_client" => {
    "init_style" => "init"
  }
)