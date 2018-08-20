module SessionsHelper

  # Logs in the given gamer.
  def log_in(gamer)
    session[:gamer_id] = gamer.id
  end

  # Returns the gamer corresponding to the remember token cookie.
  def current_gamer
    if (gamer_id = session[:gamer_id])
      @current_gamer ||= Gamer.find_by(id: gamer_id)
    elsif (gamer_id = cookies.signed[:gamer_id])
      gamer = Gamer.find_by(id: gamer_id)
      if gamer && gamer.authenticated?(:remember,cookies[:remember_token])
        log_in gamer
        @current_gamer = gamer
      end
    end
  end
  # Remembers a gamer in a persistent session.
  def remember(gamer)
    gamer.remember
    cookies.permanent.signed[:gamer_id] = gamer.id
    cookies.permanent[:remember_token] = gamer.remember_token
  end

  # Forgets a persistent session.
  def forget(gamer)
    gamer.forget
    cookies.delete(:gamer_id)
    cookies.delete(:remember_token)
  end

  # Returns true if the gamer is logged in, false otherwise.
  def logged_in?
    !current_gamer.nil?
  end

  # Logs out the current gamer.
  def log_out
    forget(current_gamer)
    session.delete(:gamer_id)
    @current_gamer = nil
  end

  # Returns true if the given user is the current user.
  def current_gamer?(gamer)
    gamer == current_gamer
  end

  # Redirects to stored location (or to the default).             REINDIRIZZA DOPO UN LOGIN ALLA PAGINA DI INTERESSE
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.                          REINDIRIZZA DOPO UN LOGIN ALLA PAGINA DI INTERESSE
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
