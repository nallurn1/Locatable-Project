# Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: user_profile.rb
 # Description: user_profile is a child to user
 # Last modified on: 4/20/22

class UserProfile < ApplicationRecord
    belongs_to :user
    validates :user_name, presence: true
    validates :user_phone, presence: true
    validates :user_email, presence: true
end
