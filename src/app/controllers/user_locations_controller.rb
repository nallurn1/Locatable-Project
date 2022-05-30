# Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: user_locations_controller.rb
 # Description: The CRUD functionilities needed for the user_locations
 # Last modified on: 5/12/22
 # Code written by Nithya Nalluri

 class UserLocationsController < ApplicationController
  before_action :set_user_location, :make_abstract_request, only: %i[ show edit update destroy ]

  # GET /user_locations or /user_locations.json
  def index
    #Where the search function is being called
    @user_locations = UserLocation.search(params[:search])
  end

  # GET /user_locations/1 or /user_locations/1.json
  def show
    # user_ip = "You IP address is #{client_ip}"
    # render plain: "You IP address is #{client_ip}"
  end

  # GET /user_locations/new
  def new
    # @user_location = UserLocation.new
    @user_location = current_user.user_location.build
    puts @user_location.user_ip = "#{client_ip}"
  end

  # GET /user_locations/1/edit
  def edit
  end

  # POST /user_locations or /user_locations.json
  def create
    @user_location = UserLocation.new(user_location_params)
    
    respond_to do |format|
      if @user_location.save
        format.html { redirect_to user_location_url(@user_location), notice: "User location was successfully created." }
        format.json { render :show, status: :created, location: @user_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_location.errors, status: :unprocessable_entity }
      end
    end
  end

  #Code Adapted from Emma Jagger
  #Link: https://www.abstractapi.com/guides/how-to-get-an-ip-address-using-ruby-on-rails
  def make_abstract_request
    @user_locations.user_location_city = client_ip

    require 'net/http'
    require 'net/https'

    #I created a local api_key, linked to my personal account
    api_key = a1d797d3953c46768d30534352b89d12
    uri = URI('https://ipgeolocation.abstractapi.com/v1/?api_key=#{api_key}&ip_address=#{client_ip}')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request =  Net::HTTP::Get.new(uri)

    response = http.request(request)
    puts "Status code: #{ response.code }"
    puts "Response body: #{ response.body }"
  rescue StandardError => error
    puts "Error (#{ error.message })"
  end

  # PATCH/PUT /user_locations/1 or /user_locations/1.json
  def update
    respond_to do |format|
      if @user_location.update(user_location_params)
        format.html { redirect_to user_location_url(@user_location), notice: "Your location was successfully updated." }
        format.json { render :show, status: :ok, location: @user_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_locations/1 or /user_locations/1.json
  def destroy
    @user_location.destroy

    respond_to do |format|
      format.html { redirect_to user_locations_url, notice: "Your location was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_location
      @user_location = UserLocation.find(params[:id])
    end

    #Use callback to get the user's ip address
    def client_ip
      request.remote_ip
    end

    # Only allow a list of trusted parameters through.
    def user_location_params
      # params[:user_location][:user_ip] = request.ip
      # @user_loaction = UserLocation,create(params[:user_location])
      params.require(:user_location).permit(:user_location_street, :user_location_city, :user_location_state, :user_location_country, :user_id, :user_ip, :search)
    end
end

