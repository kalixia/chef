name "ubuntu"
description "Configuration & settings applied to Ubuntu nodes."
run_list(
  "recipe[apt]",
  "role[base]",
  "recipe[users::sysadmins]",
  "recipe[ntp]",
  "recipe[htop]"
)
override_attributes(
  "chef_client" => {
    "init_style" => "init"
  }
)