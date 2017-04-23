#
# Cookbook:: webapp-windows
# Recipe:: webserver
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#enable IIS role

dsc_script 'Web-Server' do
  code <<-EOH
  WindowsFeature InstallWebServer
  {
    name = "Web-Server"
    Ensure = "Present"
  }
  EOH
end

#enable ASP.net role

dsc_script 'ASP.NET' do
  code <<-EOH
  WindowsFeature InstallAspDotNet45
  {
    name = "Web-Asp-Net45"
    Ensure = "Present"
  }
  EOH
end

#enable IIS MGMT

dsc_script 'Web-Mgmt-Console' do
  code <<-EOH
  WindowsFeature InstallIISConsole
  {
    name = "Web-Mgmt-Console"
    Ensure = "Present"
  }
  EOH
end

#remove default site
include_recipe 'iis::remove_default_site'

iis_site 'Default Site' do
  action [:stop, :delete]
end

iis_pool 'defaultappPool' do
  action [:stop, :delete]
end

app_directory = 'c:\inetpub\apps\Customers'
site_directory = 'c:\inetpub\site\Customers'

#download prebuilt customers app and extract
windows_zipfile app_directory do
  source 'https://github.com/learn-chef/customers-web-app-aspnet/releases/download/v0.1.0/Customers.zip'
  action :unzip
  not_if { ::File.exists?(app_directory)}
end

iis_pool 'Products' do
  runtime_version '4.0'
  action :add
end

#create site dir and assign rights to IIS_Users
directory site_directory do
  rights :read, 'IIs_IUSRs'
  recursive true
  action :create
end

iis_site 'Customers'do
  protocol :http
  port 80
  path site_directory
  application_pool 'Products'
  action [:add, :start]
end

iis_app 'Customers' do
  application_pool 'Products'
  path '/Products'
  physical_path app_directory
  action :add
end
