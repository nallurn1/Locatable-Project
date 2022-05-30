# frozen_string_literal: true

 # Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: home_controller.rb
 # Description: No login needed for the home page
 # Last modified on: 4/20/22
 # Code written by Nithya Nalluri

# Controller for the home page already made for you
class HomeController < ApplicationController
  # No sign in needed to access these pages
  # Overrides ApplicationController's instructions to check for login by default
  skip_before_action :authenticate_user!


  # GET /
  #
  # This method is empty, yet it works?
  # Rails controller methods can be completely empty and work just fine.
  # It's the name of the method matching to a html.erb file that
  # makes the link between the files.
  # Find me @ app/views/home/index.html.erb
  #
  # Also, any local variable made inside this method will also exist
  # in the view to be displayed. Do not look up information within the
  # view itself. Do it here, please!
  def index
  end

end