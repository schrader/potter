class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show]
  
  # GET /invitations
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1
  def show
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # # GET /invitations/1/edit
  # def edit
  # end

  # POST /invitations
  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.issuer = current_user
    @invitation.pot = current_pot
    
    if @invitation.save
      UserMailer.invite(@invitation).deliver
      redirect_to current_pot, notice: 'Einladung erfolgreich abgeschickt.'
    else
      render action: 'new'
    end
  end
  
  def accept
    @invitation = Invitation.find_by_token(params[:token])
    if @invitation.blank?
      redirect_to root_path, flash: {error: 'Da ist etwas grundlegend schief gelaufen, das tut uns leid :-('}
    elsif @invitation.accept!(current_user)
      redirect_to @invitation.pot, flash: {success: 'Einladung angenommen!'}
    else
      redirect_to  @invitation.pot, notice: 'Du sitzt doch schon im Pott!'
    end
  end

  # PATCH/PUT /invitations/1
  # def update
  #   if @invitation.update(invitation_params)
  #     redirect_to @invitation, notice: 'Invitation was successfully updated.'
  #   else
  #     render action: 'edit'
  #   end
  # end

  # DELETE /invitations/1
  # def destroy
  #   @invitation.destroy
  #   redirect_to invitations_url, notice: 'Invitation was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = current_pot.invitations.find(params[:id])
    end
    
    def current_pot
      @current_pot ||= Pot.find(params[:pot_id])
    end
    helper_method :current_pot

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitation_params
      params.require(:invitation).permit(:email)
    end
end
