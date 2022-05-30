# Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: user_location.rb
 # Description: Searching past locations function
 # Last modified on: 5/12/22
 #Code written by Nithya Nalluri

 class UserLocation < ApplicationRecord
    #user_locations is child to user_profile
    belongs_to :user

    #Checking is the user inputs these needed parameters
    validates :user_location_street, presence: true
    validates :user_location_city, presence: true
    validates :user_location_state, presence: true
    validates :user_location_country, presence: true

    #The searching function
    def self.search(search)
        #If the user input is a stree, city, state, or country
        if search
            location_street = UserLocation.find_by(user_location_street: search)
            location_city = UserLocation.find_by(user_location_city: search)
            location_state = UserLocation.find_by(user_location_state: search)
            location_country = UserLocation.find_by(user_location_country: search)
            #Where does the user's input exist?
            if location_street
                self.where(id: location_street) 
            elsif location_city
                self.where(id: location_city)
            elsif location_state 
                self.where(id: location_state)
            elsif location_country
                self.where(id: location_country)
            #Show all locations with the user's input
            else
                UserLocation.all
            end
        else
            UserLocation.all
        end
    end

end
