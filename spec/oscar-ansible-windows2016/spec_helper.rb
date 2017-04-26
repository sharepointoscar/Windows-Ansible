require 'serverspec'
require 'net/ssh'
require 'pathname'
require 'winrm'
set :backend, :winrm
#include SpecInfra::Helper::Ssh
# include Serverspec::Helper::Cmd
#include Serverspec::Helper::Windows
