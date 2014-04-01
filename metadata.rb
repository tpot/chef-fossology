name             'fossology'
maintainer       'Tim Potter'
maintainer_email 'tpot@hp.com'
license          'All rights reserved'
description      'Installs/Configures fossology'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "ubuntu", ">= 12.04"

depends "apt"
depends "apache2"
depends "nfs"

recipe "fossology::server", "Install a FOSSology server"
recipe "fossology::agent", "Install a FOSSology agent"
