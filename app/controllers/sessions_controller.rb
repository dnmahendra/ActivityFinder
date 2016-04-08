class SessionsController < ApplicationController

    def new

    end

    def create_app_login
      if logged_in?
        redirect_to '/'
      else
        user = User.find_by(name: params[:name])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to '/'
        else
          render :new
        end
      end
    end

    def create_fb_login
      auth_hash = request.env['omniauth.auth']

      if session[:user_id]
        # Means our user is signed in. Add the authorization to the user
        User.find(session[:user_id]).add_provider(auth_hash)

        redirect_to '/'
      else
        # Log him in or sign him up
        auth = Authorization.find_or_create(auth_hash)

        # Create the session
        session[:user_id] = auth.user.id

        redirect_to '/'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end

    def failure
      render :text => "Sorry, but you didn't allow access to our app!"
    end
end
