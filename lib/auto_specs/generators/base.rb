module AutoSpecs
  module Generators
    class Base
      SPEC_DIRECTORY_PATH = Rails.root.join('spec')

      def self.ensure_specs_directory_exists!
        ensure_path!(SPEC_DIRECTORY_PATH)
      end

      def self.ensure_path!(path)
        FileUtils.mkdir_p(path) unless File.directory?(path)
      end

      private_class_method :ensure_specs_directory_exists!,
                           :ensure_path!

      ensure_specs_directory_exists!

      private
        def write_file
          File.open(file_path, 'w') do |f|
            f.write(file_contents)
          end
        end
    end
  end
end
