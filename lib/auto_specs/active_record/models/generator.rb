require 'auto_specs/generators/model'

module AutoSpecs
  module ActiveRecord
    class Models
      def self.generate_files
        # TODO: Use ActiveRecord::Base.descendants.
        (::ActiveRecord::Base.connection.tables - %w(schema_migrations delayed_jobs)).each do |table|
          model = table.classify.constantize rescue nil
          model ? generate_file_for(model) : puts("Model not found : #{table}")
        end
      end

      def self.generate_file_for(model)
        puts "Generating Spec File for #{ model }"
        Generators::Model.new(model).push_file
      end
      private_class_method :generate_file_for
    end
  end
end

AutoSpecs::ActiveRecord::Models.generate_files
