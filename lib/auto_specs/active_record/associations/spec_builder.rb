require 'auto_specs/active_record/associations/mapping'

module AutoSpecs
  module ActiveRecord
    module Associations
      class SpecBuilder
        attr_accessor :macro, :name, :options

        def initialize(ar_reflection_object)
          @macro   = ar_reflection_object.macro
          @name    = ar_reflection_object.name
          @options = ar_reflection_object.options
        end

        def to_s
          "it { should #{ shoulda_association_mapping }(:#{ name })#{ through_association }#{ dependent_option } }"
        end

        private

          def shoulda_association_mapping
            ActiveRecord::Associations::MAPPINGS[macro.to_sym]
          end

          # TODO..Improve this..
          def through_association
            options[:through] ? ".through(:#{ options[:through] })" : ""
          end

          def dependent_option
            options[:dependent] ? ".dependent(:#{ options[:dependent] })" : ""
          end
      end
    end
  end
end
