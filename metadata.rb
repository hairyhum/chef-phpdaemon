name             'chef-phpdaemon'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures phpdaemon'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
recipe           'runkit', "Installs runkit php extension"

depends 'apt'
depends 'chef-php54'
depends 'php'
depends 'git'
depends 'chef-php-extra'
depends 'chef-libevent'
depends 'openssl'
