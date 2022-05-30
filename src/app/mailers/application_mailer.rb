 # Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: application_mailer.rb
 # Description: Email account for this web app
 # Last modified on: 4/20/22

# frozen_string_literal: true

# Controls emails sent out from the application
# TCNJ: you likely won't need this
class ApplicationMailer < ActionMailer::Base
  #Created a email for this application
  default from: 'locatableapp@gmail.com'
  layout 'mailer'
end
