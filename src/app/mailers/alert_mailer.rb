 # Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: alert_mailer.rb
 # Description: Email Message for alerts and where to send it to
 # Last modified on: 4/20/22

class AlertMailer < ApplicationMailer
    def new_alert_email
        @alert = params[:alert]

        #Not able to call this dynamically since there is a foreigen key relation
        @contact = contact.first
        # @contact = Contact.current

        mail(to: @contact.contact_email, subject: "Important Alert" )
    end
end