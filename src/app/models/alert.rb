 # Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: alert.rb
 # Description: The Alerts child and grandchild associations to contacts and user_profile
 # Last modified on: 4/20/22
 # Code written by Nithya Nalluri

class Alert < ApplicationRecord
    belongs_to :user
    belongs_to :contact
end
