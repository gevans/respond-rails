if defined?(ActionController)
  require File.join(File.dirname(__FILE__), 'app', 'helpers', 'respond_helper')
  ActionController::Base.helper(RespondHelper)
end

module Respond
  module Rails
    require 'respond/rails/engine'
    require 'respond/rails/version'
  end
end