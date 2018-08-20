class AccountAttributesController < ApplicationController
    #before_action :get_gamer

    def new
    end

     def create
        @gamer = Gamer.find_by(email: params[:email].downcase)
        if @gamer
          if (params[:account_attributes][:conssole].nil? || params[:account_attributes][:nickname].empty? || params[:account_attributes][:nation].empty? ||
             params[:account_attributes][:gammes].nil? )
             flash.now[:danger] = "All parameters not compiled"
             render 'edit'    #non riesco a reindirizzare quando faccio la edit e sbaglio volontariamente parametri nell'edit url (mi ritorna nella new url).quindi ho dovuto forzare dicendo che in caso di
             #di valori errati di reindirizzare nella edit. praticamente quando faccio la edit e faccio la submit mi entra sempre nella create invece di entrare nell'update.
          else
              if params[:account_attributes][:nation] != request.location.country
                 flash.now[:danger] = "nation doesn't match with your location:#{request.location.country}"
                 render 'edit'
              else
                 @gamer.update_attribute(:conssole,params[:account_attributes][:conssole])
                 @gamer.update_attribute(:nickname,params[:account_attributes][:nickname])
                 @gamer.update_attribute(:nation,params[:account_attributes][:nation])
                 @gamer.update_attribute(:gammes,params[:account_attributes][:gammes])
                 @gamer.update_attribute(:description,params[:account_attributes][:description])
                 @gamer.update_attribute(:updated,true)  #attributo aggiunto nel db per verificare che siano stati aggiunti gli attributi aggiuntivi nell'account

                 flash[:info] = "attributes updated"
                 redirect_to @gamer
              end
          end

        else
          flash.now[:danger] = "Email address not found"
          render 'new'
        end
    end

    def index
    end

    def edit
    end

    def update
        @gamer = Gamer.find_by(email: params[:email].downcase)
        if @gamer
          if (params[:account_attributes][:conssole].empty? || params[:account_attributes][:nickname].empty? || params[:account_attributes][:nation].empty? ||
             params[:account_attributes][:gammes].empty? )
             flash.now[:danger] = "All parameters not compiled"
             render 'edit'
          else

              if params[:account_attributes][:nation] != request.location.country
                 flash.now[:danger] = "nation doesn't match with your location#{request.location.country}"
                 render 'edit'
              else
                 @gamer.update_attribute(:conssole,params[:account_attributes][:conssole])
                 @gamer.update_attribute(:nickname,params[:account_attributes][:nickname])
                 @gamer.update_attribute(:nation,params[:account_attributes][:nation])
                 @gamer.update_attribute(:gammes,params[:account_attributes][:gammes])
                 @gamer.update_attribute(:description,params[:account_attributes][:description])
                 @gamer.update_attribute(:updated,true)  #attributo aggiunto nel db per verificare che siano stati aggiunti gli attributi aggiuntivi nell'account

                 flash[:info] = "attributes updated"
                 redirect_to @gamer
              end
          end

        else
          flash.now[:danger] = "Email address not found"
          render 'edit'
        end

    end




    private


    def gamer_params
      params.require(:gamer).permit(:email,:nickname , :description, :games , :console)
    end

    def get_gamer
      @gamer = Gamer.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_gamer
      unless (@gamer && @gamer.activated? &&
              @gamer.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

end
