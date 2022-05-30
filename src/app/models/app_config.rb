 # Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: alert.rb
 # Description: Default app configuation validations 
 # Last modified on: 4/20/22

# frozen_string_literal: true

# global app configuration model

# Fields:
# - name: string
# - logo_url: string
class AppConfig < ApplicationRecord
  # make sure all fields exist
  validates :name, :logo_url, presence: true

  # make sure app name isn't empty
  # logo can be empty. That's not a big teal tbh.
  validates_length_of :name, minimum: 1
end
