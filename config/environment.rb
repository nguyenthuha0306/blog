# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['minhld1709@gmail.com'],
    :password       => ENV['minh1991'],
    :domain         => 'localhost:3000',
    :enable_starttls_auto => true
  }