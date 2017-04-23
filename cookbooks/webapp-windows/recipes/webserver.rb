#
# Cookbook:: webapp-windows
# Recipe:: webserver
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#enable IIS role

dsc_scipt 'Web-Server' do
  code <<-EOH
  WindowsFeature InstallWebServer
  {
    name = "Web-Server"
    Ensure = "Present"
  }
  EOH
end

#enable ASP.net role

dsc_scipt 'ASP.NET' do
  code <<-EOH
  WindowsFeature InstallAspDotNet45
  {
    name = "Web-Asp-Net45"
    Ensure = "Present"
  }
  EOH
end

#enable IIS MGMT

dsc_scipt 'Web-Mgmt-Console' do
  code <<-EOH
  WindowsFeature InstallIISConsole
  {
    name = "Web-Mgmt-Console"
    Ensure = "Present"
  }
  EOH
end
