class GamersController < ApplicationController
  before_action :set_gamer, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_gamer, only: [:index,:edit, :update, :destroy]   #richiama la funzione logged in use nel caso ci sia il richiamo di edit o update (funzione di sotto)
  before_action :correct_gamer,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :check_attributes, only: [:show,:edit,:update]


  # GET /gamers
  # GET /gamers.json
  def index
    @gamers = Gamer.where(activated: true ).paginate(page: params[:page])
  end

  # GET /gamers/1
  # GET /gamers/1.json
  def show
    @gamer = Gamer.find(params[:id])
    redirect_to root_url and return unless @gamer.activated        #REINDIRIZZA A ROOT_URL FINCHE NON È ATTIVO L ACCOUNT
  end

  # GET /gamers/new
  def new
    @gamer = Gamer.new
  end

  # GET /gamers/1/edit
  def edit
    @gamer = Gamer.find(params[:id])
  end

  # POST /gamers
  # POST /gamers.json
  def create
    @gamer = Gamer.new(gamer_params)


      if @gamer.save
          @gamer.send_activation_email
          flash[:info] = "Please check your email to activate your account."
          redirect_to root_url
      else

        render 'new'

      end

  end

  # PATCH/PUT /gamers/1
  # PATCH/PUT /gamers/1.json
  def update
    respond_to do |format|
      if @gamer.update(gamer_params)
        format.html { redirect_to edit_account_attribute_url(email: @gamer.email), notice: 'Gamer was successfully updated.' }
        format.json { render :show, status: :ok, location: @gamer }
      else
        format.html { redirect_to edit_account_attribute_url(email: @gamer.email) }
      end
    end
  end

  # DELETE /gamers/1
  # DELETE /gamers/1.json
  def destroy
    @gamer.destroy
    respond_to do |format|
      format.html { redirect_to gamers_url, notice: 'Gamer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamer
      @gamer = Gamer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gamer_params
      params.require(:gamer).permit(:username, :email, :password , :password_confirmation, :gammes , :conssole , :nickname ,:nation,:updated)   #aggiunto gli ultimi 2  MANCAVA QUESTO (SENZA L AGGIUNTA NON VENIVANO INSERITI E VEDEVA PASSWORD VUOTE
    end

    # Confirms a logged-in gamer.
    def logged_in_gamer
      unless logged_in?
        store_location    #VEDI SESSION HELPER
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # Confirms the correct gamer.
    def correct_gamer
      @Gamer = Gamer.find(params[:id])
      redirect_to(root_url) unless @gamer == current_gamer
    end

     def admin_user
      redirect_to(root_url) unless current_gamer.admin?
    end

    def check_attributes
       @gamer = Gamer.find(params[:id])
       if !@gamer.updated && @gamer==current_gamer
            flash[:danger] = "Please change your attributes#{@gamer.updated}"
            redirect_to new_account_attribute_url(email: @gamer.email)
       end
    end

end
