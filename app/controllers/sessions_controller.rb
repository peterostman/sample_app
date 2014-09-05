class SessionsController < ApplicationController

	def new
	end

	def create
		if request.env['omniauth.auth']
	
			user = User.from_omniauth(env["omniauth.auth"])
	    	sign_in user
	    	redirect_back_or user

    	else

		    user = User.find_by_email(params[:session][:email])
		    if user && user.authenticate(params[:session][:password])
		      sign_in user
		      redirect_back_or user
		    else
		      flash.now[:error] = "Invalid email/password combination"
		      render 'new'
		    end
    	end
	end

	def destroy
		sign_out
    	redirect_to root_url
	end

end
