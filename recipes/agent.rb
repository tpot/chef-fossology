#
# Cookbook Name:: fossology
# Recipe:: agent
#
# Copyright (C) 2014, Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "etc"

# Install and configure agent-only node

include_recipe "fossology::apt"

agent_packages = ["fossology-common", "fossology-buckets", "fossology-copyright",
                  "fossology-delagent", "fossology-mimetype", "fossology-nomos",
                  "fossology-pkgagent", "fossology-ununpack", "fossology-wgetagent"]

agent_packages.each do |p|
  package p
end

include_recipe "fossology::config"
include_recipe "nfs"

mount "/srv/fossology/repository" do
  fstype "nfs"
  device "#{node["fossology"]["server"]["name"]}:/srv/fossology/repository"
  options ["rw"]
  action [:mount, :enable]
end
