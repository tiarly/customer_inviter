require "rubygems"
require "bundler"
Bundler.setup

class CustomerInviter
end

Dir[File.expand_path(File.dirname(__FILE__) + "/customer_inviter/*.rb")].each do |file|
  require file
end