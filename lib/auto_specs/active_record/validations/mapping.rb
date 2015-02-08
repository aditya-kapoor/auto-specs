module AutoSpecs
  module ActiveRecord
    module Validations
      MAPPINGS = {
        'PresenceValidator'     => 'validate_presence_of',
        'UniquenessValidator'   => 'validate_uniqueness_of',
        'NumericalityValidator' => 'validate_numericality_of',
        'LengthValidator'       => 'validate_length_of',
        'ConfirmationValidator' => 'validate_confirmation_of',
        'InclusionValidator'    => 'validate_inclusion_of',
        'ExclusionValidator'    => 'validate_exclusion_of'
      }
    end
  end
end
