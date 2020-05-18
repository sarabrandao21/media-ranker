class UsersController < ApplicationController
  def index 
    @users = User.all
  end 
  
  def show
    user_id = session[:user_id]
    @user = User.find_by(id: user_id)
    if @user.nil?
      head :not_found 
      return
    end 
  end 
  
  def login_form
    @user = User.new
  end
  
  def login
    username = params[:user][:username]
    
    user = User.find_by(username: username)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as returning user #{username}"
    else
      user = User.create(username: username)
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as new user #{username}"
    end
    
    redirect_to root_path
    return
  end
  def logout 
    if session[:user_id] 
      user = User.find_by(id: session[:user_id])
      unless user.nil? 
        session[:user_id] = nil
        redirect_to root_path
        flash[:notice] = "Goodbye #{user.username}"
      else
        session[:user_id] = nil 
        flash[:notice] = "Error unknown user"
      end
    else  
      redirect_to root_path
      flash[:error] = "You must be logged in to logout"
      
      return
    end 
  end 
  
  def current 
    @user = User.find_by(id: session[:user_id])
    if @user.nil? 
      redirect_to root_path
      flash[:error] = "You must be logged in to view this page"
      return 
    end 
  end
end




