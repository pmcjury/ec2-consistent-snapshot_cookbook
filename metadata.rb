name             'ec2-consistent-snapshot'
maintainer       'Patrick H. McJury'
maintainer_email 'patrick.mcjury@macmillan.com'
license          'MIT'
description      'Installs/Configures ec2-consistent-snapshot'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'yum'
depends 'xfs'
depends 'apt'

recipe 'ec2-consistent-snapshot::default', 'installs ec2-consistent-snapshot script https://github.com/alestic/ec2-consistent-snapshot'
