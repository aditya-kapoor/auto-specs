require 'auto_specs/active_record/validations/mapping'
require 'auto_specs/active_record/validations/helpers/general_methods'
require 'auto_specs/active_record/validations/helpers/numericality_methods'
require 'auto_specs/active_record/validations/helpers/length_methods'
require 'auto_specs/active_record/validations/helpers/inclusion_methods'

module AutoSpecs
  module ActiveRecord
    module Validations
      class SpecBuilder
        include Helpers::GeneralMethods
        include Helpers::NumericalityMethods
        include Helpers::LengthMethods
        include Helpers::InclusionMethods

        attr_accessor :attributes, :validator_class, :options

        def initialize(validator_object)
          @validator_class = validator_object.class.to_s.demodulize
          @attributes      = validator_object.attributes
          @options         = validator_object.options
        end

        def to_s
          attributes.collect do |_attr_|
            "it { should #{ shoulda_validation_mapping }(:#{ _attr_ })#{ append_options } }"
          end.join("\n")
        end

        private
          def shoulda_validation_mapping
            ActiveRecord::Validations::MAPPINGS[validator_class]
          end

          def append_options
            options_str = options.keys.collect do |key|
              send("#{ key }_option")
            end.join('.')
            options_str.prepend('.') unless options_str.blank?
          end
      end
    end
  end
end
