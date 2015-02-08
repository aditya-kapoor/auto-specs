module AutoSpecs
  module ActiveRecord
    module Validations
      module Helpers
        module NumericalityMethods
          [:less_than, :less_than_or_equal_to, :equal_to, :greater_than, :greater_than_or_equal_to].each do |option|
            method_name = "#{ option }_option"
            define_method method_name do
              "is_#{ option }(#{ options[option] })"
            end
            private method_name
          end

          private
            def only_integer_option
              "only_integer"
            end

            def even_option
              options[:even] ? "even" : "odd"
            end

            def odd_option
              options[:odd] ? "odd" : "even"
            end
        end
      end
    end
  end
end
