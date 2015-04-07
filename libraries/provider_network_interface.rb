#
# Author:: Jacob McCann (<jacob.mccann2@target.com>)
# Cookbook Name:: network_interfaces_v2
# Provider:: network_interface
#
# Copyright:: 2015, Target Corporation
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

require 'chef/provider'

class Chef
  class Provider
    #
    # Chef Provider for Network Interfaces
    #
    class NetworkInterface < Chef::Provider::LWRPBase
      # We MUST define this method in our custom provider
      def load_current_resource; end

      def action_create
        converge_by("create interface #{new_resource.device}") do
          create_interface
        end
      end

      def create_interface
        raise Chef::Exceptions::UnsupportedAction, "#{self.to_s} does not support :create"
      end
    end
  end
end
