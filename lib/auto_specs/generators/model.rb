require 'auto_specs/generators/base'
require 'auto_specs/active_record/associations/spec_builder'
require 'auto_specs/active_record/validations/spec_builder'

module AutoSpecs
  module Generators
    class Model < Base
      MODEL_SPEC_DIRECTORY_PATH = SPEC_DIRECTORY_PATH.join('models')

      def self.ensure_model_specs_directory_exists!
        ensure_path!(MODEL_SPEC_DIRECTORY_PATH)
      end

      ensure_model_specs_directory_exists!

      attr_accessor :model_name, :file_contents

      def initialize(model_name)
        @model_name    = model_name
        @file_contents = ''
      end

      def push_file
        within_file_code do
          generate_code_for_associations
          generate_code_for_validations
        end
        write_file
      end

      private_class_method :ensure_model_specs_directory_exists!

      private

        def within_file_code
          self.file_contents += %Q(require 'spec_helper'

describe #{ model_name } do)
          yield
          self.file_contents += %Q(end)
        end

        def generate_code_for_associations
          generate_code_block_for('Associations')
          model_name.reflect_on_all_associations.each do |reflection|
            self.file_contents += %Q(
    #{ AutoSpecs::ActiveRecord::Associations::SpecBuilder.new(reflection).to_s })
          end
          self.file_contents += %Q(
  end
)
        end

        def generate_code_for_validations
          generate_code_block_for('Validations')
          model_name.validators.each do |validator|
            self.file_contents += %Q(
    #{ AutoSpecs::ActiveRecord::Validations::SpecBuilder.new(validator).to_s })
          end
          self.file_contents += %Q(
  end
)
        end

        def generate_code_block_for(entity)
          self.file_contents += %Q(
  context '#{ entity }' do)
        end

        def file_path
          MODEL_SPEC_DIRECTORY_PATH.join("#{ model_name.to_s.underscore }_spec.rb")
        end
    end
  end
end
