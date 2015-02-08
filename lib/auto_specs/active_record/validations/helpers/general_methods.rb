module AutoSpecs
  module ActiveRecord
    module Validations
      module Helpers
        module GeneralMethods
          private
            def on_option
              "on(:#{ options[:on] })"
            end

            def message_option
              "with_message('#{ options[:message] }')"
            end

            def scope_option
              "scoped_to(:#{ options[:scope] })"
            end

            def case_sensitive_option
              options[:case_sensitive] ? "case_sensitive" : "case_insensitive"
            end

            def allow_nil_option
              "allow_nil"
            end

            def allow_blank_option
              "allow_blank"
            end
        end
      end
    end
  end
end
