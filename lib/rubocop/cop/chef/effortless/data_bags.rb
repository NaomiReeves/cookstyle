#
# Copyright:: Copyright 2019, Chef Software Inc.
# Author:: Tim Smith (<tsmith@chef.io>)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
module RuboCop
  module Cop
    module Chef
      module ChefEffortless
        # Data bags cannot be used with the Effortless Infra pattern
        #
        # @example
        #
        #   # bad
        #   data_bag_item('admins', login)
        #   data_bag(data_bag_name)
        class CookbookUsesDatabags < Cop
          MSG = 'Cookbook uses data bags, which cannot be used in the Effortless Infra pattern'.freeze

          def on_send(node)
            add_offense(node, location: :expression, message: MSG, severity: :refactor) if %i(data_bag data_bag_item).include?(node.method_name)
          end
        end
      end
    end
  end
end
