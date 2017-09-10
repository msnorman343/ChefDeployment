
# frozen_string_literal: true
default['icinga2']['apache_modules'] = value_for_platform(
  %w(amazon) => { 'default' => %w(default mod_python mod_php5 mod_cgi mod_ssl mod_rewrite) },
  %w(debian raspbian) => { 'default' => %w(default mod_python mod_php5 mod_cgi mod_ssl mod_rewrite mpm_prefork) },
  %w(ubuntu) => { 'default' => %w(default mod_python mod_php5 mod_cgi mod_ssl mod_rewrite mpm_prefork),
                  '>= 16.04' => %w(default mod_python mod_cgi mod_ssl mod_rewrite mpm_prefork) },
  %w(centos redhat fedora) => { '>= 7.0' => %w(default mod_wsgi mod_php5 mod_cgi mod_ssl mod_rewrite),
                                'default' => %w(default mod_python mod_php5 mod_cgi mod_ssl mod_rewrite) }
)

default['icinga2']['apache_classic_ui_template'] = "apache.vhost.icinga2_classic_ui.conf.#{node['platform_family']}.erb"
default['icinga2']['apache_web2_template'] = 'apache.vhost.icinga2_web2.erb'
default['icinga2']['apache_conf_cookbook'] = 'icinga2'
