module AutoSpecs
  module ActiveRecord
    module Validations
      module Helpers
        module InclusionMethods
          private
            def in_option
              "in_#{ options[:in].class.name.downcase }(#{ options[:in] })"
            end
        end
      end
    end
  end
end
