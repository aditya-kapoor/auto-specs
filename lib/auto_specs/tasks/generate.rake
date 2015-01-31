namespace :auto_specs do

  desc 'Generate Specs for Models.'
  task models: :environment do
    AutoSpecs::Base.generate_spec_files_for('models')
  end

  desc 'Generates Specs for Controllers'
  task :controllers do
    # TODO...
    # AutoSpecs::Base.generate_spec_files_for(:controllers)
  end
end
