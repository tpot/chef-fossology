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

# Version attributes

default["fossology"]["version"] = "2.4.0"
default["fossology"]["server_name"] = "localhost"

# Define attributes for the server node

default["fossology"]["server"] = {
  "name" => "localhost", 
  "max_jobs" => 10
}

# SSH attributes

default["fossology"]["ssh_public_key"] = nil
default["fossology"]["ssh_private_key"] = nil

default["openssh"]["client"] = {
  "*" => {
    "strict_host_key_checking" => "no"
  }
}

# PostgreSQL tuning

default["postgresql"]["config"]["listen_addresses"] = "*"
