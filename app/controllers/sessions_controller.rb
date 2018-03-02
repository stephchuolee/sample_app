class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to user's show page
      log_in user # log_in(user)
      redirect_to user
    else 
      # Create an error message
      flash.now[:danger] = 'Invalid email/password combination' # flash.now is used because it displays flash messages on rendered pages, not reloads/additional requests
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
