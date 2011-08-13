#
# Cookbook Name:: chef-client-mac
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/Library/LaunchDaemons/com.opscode.chef-client.plist" do
  source "chef-client.plist.erb"
end