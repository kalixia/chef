#
# Cookbook Name:: cassandra
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'java'

user "cassandra" do
  comment "Cassandra"
  home "/usr/local/apache-cassandra-#{node["cassandra"]["version"]}"
  shell "/bin/bash"
end

bash "download_cassandra" do
  user "root"
  cwd "/usr/local"
  code <<-EOH
  if [ ! -d "/usr/local/apache-cassandra-#{node["cassandra"]["version"]}" ]; then
    wget http://mirror.ibcp.fr/pub/apache//cassandra/#{node["cassandra"]["version"]}/apache-cassandra-#{node["cassandra"]["version"]}-bin.tar.gz
    tar -zxf apache-cassandra-#{node["cassandra"]["version"]}-bin.tar.gz
    rm apache-cassandra-#{node["cassandra"]["version"]}-bin.tar.gz 
    chown -R cassandra /usr/local/apache-cassandra-#{node["cassandra"]["version"]}
  fi
  EOH
end

link "/usr/local/cassandra" do
  to "/usr/local/apache-cassandra-#{node["cassandra"]["version"]}"
end

template "/usr/local/cassandra/conf/cassandra.yaml" do
  source "cassandra.yaml.erb"
  owner "cassandra"
  mode 0644
  variables(
    :cluster_name => node[:cassandra][:cluster_name]
  )
end

cookbook_file "/usr/local/cassandra/lib/jna.jar" do
  source "jna.jar"
  owner "cassandra"
  mode 0644
end

directory "/var/lib/cassandra" do
  owner "cassandra"
end

directory "/var/log/cassandra" do
  owner "cassandra"
end
