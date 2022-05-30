 # Project name: Locatable
 # Description: Sending out alerts to the user's close contacts when they are in possible danger
 # Filename: alerts_controller.rb
 # Description: The CRUD functionilities needed for the alerts 
 # Last modified on: 4/20/22
 # Code written by Nithya Nalluri


class AlertsController < ApplicationController
  before_action :set_alert, only: %i[ show edit update destroy ]
  # before_filter :prepare_contacts

  # GET /alerts or /alerts.json
  def index
    @alerts = current_user.alert.all
  end

  # GET /alerts/1 or /alerts/1.json
  def show
  end

  # GET /alerts/new
  def new
    # @alert = Alert.new
    #Alerts for current user (whoever is logged in) 
    @alert = current_user.alert.build

    #Bug here.... should not be allowed for other usesto see the contact info from other accounts
    @contacts = Contact.all
    # @contacts = current_user.contact.build
  end

  # GET /alerts/1/edit
  def edit
    @contacts = Contact.all
  end

  # POST /alerts or /alerts.json
  def create
    @alert = Alert.new(alert_params)

    respond_to do |format|
      if @alert.save
        AlertMailer.with(alert: @alert).new_alert_email.deliver_later
        format.html { redirect_to alert_url(@alert), notice: "Alert was successfully created." }
        format.json { render :show, status: :created, location: @alert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1 or /alerts/1.json
  def update
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to alert_url(@alert), notice: "Alert was successfully updated." }
        format.json { render :show, status: :ok, location: @alert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1 or /alerts/1.json
  def destroy
    @alert.destroy

    respond_to do |format|
      format.html { redirect_to alerts_url, notice: "Alert was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # def prepare_contacts
    #   @contacts = Conatact.all
    # end

    # Only allow a list of trusted parameters through.
    def alert_params
      params.require(:alert).permit(:alert_text, :alert_type, :contact_id, :user_id)
    end
end
