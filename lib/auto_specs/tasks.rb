require 'rake'

%w(generate).each do |task|
  load "auto_specs/tasks/#{ task }.rake"
end
