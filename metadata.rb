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

name             'fossology'
maintainer       'Tim Potter'
maintainer_email 'tpot@hp.com'
license          'Apache 2.0'
description      'Installs/Configures fossology'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "ubuntu", ">= 12.04"

depends "apt"
depends "apache2"
depends "nfs"
depends "postgresql"
depends "openssh"
depends "user"

recipe "fossology::server", "Install a FOSSology server"
recipe "fossology::agent", "Install a FOSSology agent"
