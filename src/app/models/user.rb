 # Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: user.rb
 # Description: Default account configurations and parents to all scaffolds
 # Last modified on: 4/20/22

# frozen_string_literal: true

# Represents a user of the web application
class User < ApplicationRecord
  # Devise is a premade system for managing logins
  # You don't need to do login yourself. It's done for you.
  # TCNJ: don't edit the login system.

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :contact
  has_many :user_profile
  has_many :user_location
  has_many :alert
end
