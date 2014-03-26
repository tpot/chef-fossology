#
# Cookbook Name:: fossology
# Recipe:: server
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# All rights reserved - Do Not Redistribute
#

# Install fossology

include_recipe "fossology::apt"
package "fossology"

# Install and configure apache2

include_recipe "fossology::apache2"
