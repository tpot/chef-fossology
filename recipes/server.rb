#
# Cookbook Name:: fossology
# Recipe:: server
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

# Install and configure fossology server node

include_recipe "fossology::apt"
package "fossology"

include_recipe "fossology::config"

# Install and configure apache2

include_recipe "fossology::apache2"
