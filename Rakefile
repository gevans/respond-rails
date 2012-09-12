# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = 'respond-rails'
  gem.homepage = 'https://github.com/scottjehl/Respond'
  gem.licenses = ['MIT', 'GPL-2']
  gem.summary = %Q{A fast & lightweight polyfill for min/max-width CSS3 Media Queries (for IE 6-8, and more)}
  gem.email = ['gabriel@codeconcoction.com', 'scott@scottjehl.com']
  gem.authors = ['Gabriel Evans', 'Scott Jehl']
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "respond-rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :respond do
  namespace :update do
    desc 'Update Respond.js from git using a tag)'
    task :tag, :tag, :giturl do |t, args|
      args.with_defaults(:giturl => 'https://github.com/scottjehl/Respond.git')
      raise "Required argument missing. Must specify tag." if !args[:tag]

      require 'tmpdir'
      Dir.mktmpdir { |dirname|
        sh "cd #{dirname} && git clone #{args[:giturl]} && cd Respond && git checkout #{args[:tag]}"

        srcdir    = "#{dirname}/Respond"
        targetdir = Rake.original_dir

        cp "#{srcdir}/respond.min.js",                  "#{targetdir}/vendor/assets/javascripts/respond.js"
        cp "#{srcdir}/cross-domain/respond-proxy.html", "#{targetdir}/vendor/assets/javascripts/respond-proxy.html"
        cp "#{srcdir}/cross-domain/respond.proxy.js",   "#{targetdir}/vendor/assets/javascripts/respond.proxy.js"
        cp "#{srcdir}/cross-domain/respond.proxy.gif",  "#{targetdir}/vendor/assets/images/respond.proxy.gif"
      }
    end
  end
end
