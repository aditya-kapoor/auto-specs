require 'auto_specs/version'
require 'auto_specs/tasks'

module AutoSpecs
  class Base
    def self.generate_spec_files_for(entity)
      if defined?(::ActiveRecord::Base)
        require "auto_specs/active_record/#{ entity }/generator"
      else
        # TODO...
      end
    end
  end
end
