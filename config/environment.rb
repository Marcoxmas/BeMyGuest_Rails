# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


 ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address =>    "smtp.gmail.com",
    :port    =>   587,
    :user_name =>  "trial.shopify1@gmail.com",
    :password  =>  Rails.application.credentials[:gmailpw],
    :authentication => "plain",

    :enable_starttls_auto => true
  }

