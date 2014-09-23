require 'pry'
require 'fileutils'
include FileUtils

namespace :greetings do
  desc "Prints thank you"
  task :thank_you do
    puts "Thank You"
  end
  task :default => [:thank_you]
  # task that takes a name argument and greet someone
  desc "greetings in french"
  task :bonjour, [:name] do |cmd, args|
    puts "Salut #{args[:name]}"
  end

  desc "Bonjour"
  task :default do
    puts "Hello, Im the default task."
  end

end

namespace :cake do

  desc "Bake a Cake"
  task :bake => [:mix_up, :go_to_store] do
    puts "Cake is baked"
  end

  task :mix_up => [:add_flower, :add_eggs] do
    puts "Mix up ingredients"
  end

  task :add_flower => :get_flower do
    puts "Adding flower"
  end

  task :add_eggs => :go_to_store do
    puts "Adding Eggs"
  end

  task :get_flower => :go_to_store do
    puts "Get Flower"
  end

  task :go_to_store do
    puts "Go to Store"
  end

  # THESE CODES DON'T WORK
  # desc "things I can't spell"
  # task :learn_to_spell, [:word]  do |cmd, args|
  #   puts "need to learn how to spell, #{args[:word]}."
  # end
end


namespace :dozer do
  desc "print ENV"
  task :env do
    # executed in bash shell
    sh("ENV")
  end

  desc "print PWD"
  task :pwd do
    # both do the same
    sh("pwd")
    system("pwd")
  end

  desc "adds views for a resource"
  task :make_views, [:resource_name] do |cmd, args|
    resource = args[:resource_name]
    sh("mkdir views/#{resource}")
    sh("touch views/#{resource}/index.erb")
    FileUtils.touch("views/#{resource}/new.erb")
    # we can call touch directly because we included fileutils
    touch("views/#{resource}/edit.erb")
    touch("views/#{resource}/show.erb")
  end
end


# $rake db:create

namespace :db do
  desc "creates a db"
  task :create, [:dbname] do |cmd, args|
    dbname = args[:dbname]
    sh("createdb #{dbname}")
  end

  desc "drops a db"
  task :drop, [:dbname] do |cmd, args|
    dbname = args[:dbname]
    sh("dropdb #{dbname}")
  end



  desc "seed my db"
  task :seed, [:env] do |cmd, args|
    env = args[:env] || "development"
    # load up my sinatra environment
    # then populate my databsae
    Rake::Task['environment'].invoke(env)
    # this invokes namespace bunder and all the tasks in it.
    require './db/seeds'
  end
# hardocde name
# should create a db called dvr_app_test

  # namespace :bundler do
  #   task :setup do
  #     require 'rubygems'
  #     require 'bundler'
  #   end
  # end

  # task :environment, [:env] => 'bundler:setup' do |cmd, args|
  #   ENV["RACK_ENV"] = args[:env] || "development"
  #   Bundler.require(:default, ENV["RACK_ENV"])
  #   require "./config/boot"
  # end
end
