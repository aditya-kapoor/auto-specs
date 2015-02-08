module AutoSpecs
  module ActiveRecord
    module Validations
      module Helpers
        module LengthMethods
          private
            def minimum_option
              "is_at_least(#{ options[:minimum] })"
            end

            def maximum_option
              "is_at_most(#{ options[:maximum] })"
            end

            def is_option
              "is_equal_to(#{ options[:is] })"
            end

            def too_short_option
              "with_short_message('#{ options[:too_short] }')"
            end

            def too_long_option
              "with_long_message('#{ options[:too_long] }')"
            end
        end
      end
    end
  end
end
