#
# Cookbook:: webapp-windows
# Recipe:: database
#
# Copyright:: 2017, The Authors, All Rights Reserved.


include_recipe 'sql_server::server'

#point to our create file
create_database_script_path = win_friendly_path(file.join(Chef::Config[:file_cache_path], 'create-database.sql'))

#copy create db to cache

cookbook_file create_database_script_path do
  source 'create-database.sql'
end

#get path to sql server power module
sqlps_modul_path = File.join(ENV['programfiles(x86)'], 'Microsoft SQL Server \110\Tools\Powershell\Modules\SQLPS')

#run the sql file but only if it isn't there

powershell_script 'Init DB' do
  code <<- EOH
  Import-Module "#{sqlps_modul_path}"
  Invoke-Sqlcmd -InputFile "#{create_database_script_path}"
  EOH
  guard_interpreter :powershell_script
  only_if <<- EOH
  Import-Module "#{sqlps_modul_path}"
  (Invoke-Sqlcmd -Query "Select Count(*) as Count from sys.databases where name = 'learnchef'").Count -eq 0
  EOH
end
