# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings {
    :address => 'mail.eichlersolutions.de',
    :port => '25',
    :authentication => :plain,
    :user_name => 'me@eichlersolutions.de',
    :password => '!5290Qwer',
    :domain => 'eichlersolutions.de',
    :enable_starttls_auto => true
}
