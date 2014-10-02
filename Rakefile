#!/usr/bin/env rake

# Style tests. Rubocop and Foodcritic
namespace :style do
  begin
    require 'rubocop/rake_task'
    desc 'Run Ruby style checks'
    RuboCop::RakeTask.new(:ruby)
  rescue LoadError
    puts '>> Rubocop gem not loaded, omitting tasks' unless ENV['CI']
  end

  begin
    require 'foodcritic'
    desc 'Run Chef style checks'
    FoodCritic::Rake::LintTask.new(:chef) do |t|
      t.options = {
        fail_tags: ['any'],
        tags: ['~FC005']
      }
    end
  rescue LoadError
    puts '>>>>> Foodcritic gem not loaded, omitting tasks' unless ENV['CI']
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

begin
  require 'rspec/core/rake_task'
  desc 'Run ChefSpec examples'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  puts '>>>>> Rspec gem not loaded, omitting tasks' unless ENV['CI']
end

# Integration tests. Kitchen.ci
namespace :integration do
  begin
    require 'kitchen'
    desc 'Run Test Kitchen with Vagrant'
    task :vagrant do
      Kitchen.logger = Kitchen.default_file_logger
      Kitchen::Config.new.instances.each do |instance|
        instance.test(:always)
      end
    end

    task :cloud do
      Kitchen.logger = Kitchen.default_file_logger
      @loader = Kitchen::Loader::YAML.new(project_config: './.kitchen.cloud.yml')
      config = Kitchen::Config.new(loader: @loader)
      config.instances.each do |instance|
        instance.test(:always)
      end
    end
  rescue LoadError
    puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
  end
end

# Default
task default: ['style', 'spec', 'integration:vagrant']

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end
