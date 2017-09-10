# frozen_string_literal: true
name 'icinga2'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache-2.0'
description 'Installs/Configures Icinga2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.0.0'

chef_version '>= 12' if respond_to?(:chef_version)

source_url 'https://github.com/Icinga/chef-icinga2' if respond_to?(:source_url)
issues_url 'https://dev.icinga.org/projects/chef-icinga2' if respond_to?(:issues_url)

depends 'apt', '~> 5.0.1'
depends 'yum', '~> 4.1.0'
depends 'yum-epel', '~> 2.1.1'
depends 'apache2', '~> 3.2.2'
depends 'ulimit', '~> 0.4.0'
depends 'pnp4nagios', '~> 0.2.8'
depends 'chocolatey', '~> 1.0.3'

%w(redhat centos amazon ubuntu debian windows).each do |os|
  supports os
end
