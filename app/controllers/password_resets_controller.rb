class PasswordResetsController < ApplicationController
  before_action :get_gamer,   only: [:edit, :update]
  before_action :valid_gamer, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)

  def new
  end

  def create
    @gamer = Gamer.find_by(email: params[:password_reset][:email].downcase)
    if @gamer
      @gamer.create_reset_digest
      @gamer.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:gamer][:password].empty?                  # Case (3)
      @gamer.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @gamer.update_attributes(gamer_params)          # Case (4)
      log_in @gamer
      @gamer.update_attribute(:reset_digest, nil)    #pulisce il reset dopo la modifica
      flash[:success] = "Password has been reset."
      redirect_to @gamer
    else
      render 'edit'                                     # Case (2)
    end
  end



  private


    def gamer_params
      params.require(:gamer).permit(:password, :password_confirmation)
    end

    def get_gamer
      @gamer = Gamer.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_gamer
      unless (@gamer && @gamer.activated? &&
              @gamer.authenticated?(:reset, params[:id]))    #richiama params[:id] posto nell' url del form for di edit.html.erb (per questo inserisce params[:id] nel path per il routing della form
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
     # if @gamer.password_reset_expired?     NON RIESCO A FARLO PARTIRE CON IL TIMER MI RIMANDA IN NEW (ENTRANDO SEMPRE DENTRO LA CONDIZIONE)
     #   flash[:danger] = "Password reset has expired."
     #   redirect_to new_password_reset_url
     #end
    end
end
