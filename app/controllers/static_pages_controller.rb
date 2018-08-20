class StaticPagesController < ApplicationController


  def home
  	if logged_in? 
  		#redirect_to controller: 'arena_pages',action: arena
  		render "arena_pages/arena"
  	end
  end

  def help
  end

  def about
  end


end
