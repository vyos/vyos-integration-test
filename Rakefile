require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

spec_tasks = []
configs = {}
tests = Dir.glob('spec/*/').map { |s| s.gsub(%r{spec/}, '').gsub(%r{/}, '') }
tests.each do |test|
  spec_tasks.concat(["spec:#{test}"])
  configs[test] = YAML.load_file("spec/#{test}/config.yaml")
end

task spec: spec_tasks
task all: 'spec:all'

namespace :spec do
  tests.each do |test|
    config = configs[test]
    task test.to_sym do
      puts "Running #{test} test..."
      Dir.chdir("spec/#{test}") do
        `vagrant up --provider=libvirt`
      end

      config.keys.each do |host|
        Rake::Task["spec:#{test}:#{host}"].invoke
      end

      puts "Cleanup #{test} test..."
      Dir.chdir("spec/#{test}") do
        `vagrant destroy`
      end
    end
  end

  tests.each do |test|
    namespace test do
      config = configs[test]
      Dir.chdir("spec/#{test}") do
        config.keys.each do |host|
          RSpec::Core::RakeTask.new(host.to_sym) do |t|
            ENV['TARGET_TEST'] = test
            ENV['TARGET_HOST'] = host
            if ENV['CI_FLAG']
              t.rspec_opts = "--format RspecJunitFormatter --out ./report/serverspec/results_#{test}_#{host}.xml"
            end
            t.pattern = "spec/#{test}/#{host}_spec.rb"
          end
        end
      end
    end
  end
end
