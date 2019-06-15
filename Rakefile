# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

Dir['tasks/**/*.rake'].each { |t| load t }

task ci: %i[spec rubocop reek]
task default: :spec
