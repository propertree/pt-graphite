name             'pt-graphite'
maintainer       'ProperTree'
maintainer_email 'lee@propertreefacilities.com'
license          'MIT'
description      'Installs and configures Graphite'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'default', 'Installs Graphite and Graphite Web'
recipe 'pt-graphite::graphite', 'Installs Graphite'
recipe 'pt-graphite::graphite_web', 'Installs Graphite Web'

depends 'apache2', '>= 2.0'

supports 'ubuntu', '>= 14.04'
