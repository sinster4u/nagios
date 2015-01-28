#
# Author:: Sander Botman <sbotman@schubergphilis.com>
# Cookbook Name : nagios
# Definition    : hostgroup
#
# Copyright 2015, Sander Botman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

define :nagios_hostgroup do
  params[:action] ||= :create  
  params[:options] ||= {}

  if :action == :create || :action == :add
    o = Nagios::Hostgroup.create(params[:name])
    o.import(params[:options])
  end

  if :action == :delete || :action == :remove
    Nagios.instance.delete('hostgroup', params[:name])
  end
end 
