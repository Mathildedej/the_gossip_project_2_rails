class SessionsController < ApplicationController
  
  #skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    puts "$$$"*20
    puts params[:password]
    puts "$$$"*20
    puts @user.authenticate(params[:password])
    puts "$$$"*20
    if @user && @user.authenticate(params[:password])
       sessions[:user_id] = @user.id
       redirect_to gossips_path
    else
      flash[:alert] = 'Invalid email/password combination'
       redirect_to new_session_path
    end
 end

  def destroy
  end

  def page_requires_login
  end

end
