#
# Copyright:: 2019, Chef Software Inc.
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
      module ChefDeprecations
        # Don't use the deprecated 'attribute' metadata value
        #
        # @example
        #
        #   # bad in metadata.rb:
        #
        #    attribute 'zookeeper_bridge/server',
        #              display_name: 'zookeeper server',
        #              description: 'Zookeeper server address.',
        #              type: 'string',
        #              required: 'optional',
        #              default: '"127.0.0.1:2181"'
        class AttributeMetadata < Cop
          MSG = "Don't use the deprecated 'attribute' metadata value".freeze

          def on_send(node)
            add_offense(node, location: :expression, message: MSG, severity: :refactor) if node.method_name == :attribute
          end

          def autocorrect(node)
            lambda do |corrector|
              corrector.remove(node.loc.expression)
            end
          end
        end
      end
    end
  end
end
