module AutoSpecs
  module ActiveRecord
    module Associations
      MAPPINGS = {
        belongs_to:              'belong_to',
        has_many:                'have_many',
        has_one:                 'have_one',
        has_many:                'have_many',
        has_and_belongs_to_many: 'have_and_belongs_to_many'
      }
    end
  end
end
