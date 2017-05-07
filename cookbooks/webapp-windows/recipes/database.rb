#
# Cookbook:: webapp-windows
# Recipe:: database
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'sql_server::server'

#create database, table and customer db
#create a path to create database sql in chef cache
create_database_script_path = win_friendly_path(File.join())
