 # Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: contact.rb
 # Description: Conatct association with user_profile and validations 
 # Last modified on: 4/20/22


class Contact < ApplicationRecord
    belongs_to :user
    has_many :alert
    validates :contact_name, presence: true
    validates :contact_email, presence: true
    validates :contact_phone, presence: true
    validates :contact_relation, presence: true
end
