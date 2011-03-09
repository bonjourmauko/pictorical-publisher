class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.sorted.all
  end
  
  def show
    @user = User.find(params[:id])
  end  
  
  def mature #releases the user from tutorial
    
    @user = User.find(params[:id])
    @user.tutorial_mode = false
    if @user.save
      redirect_to @user, :notice => "user changed"
    else
      redirect_to @user, :notice => "user was not changed"
    end
    
    
  end
  
  def demature #sends the user back to tutorial
    
    @user = User.find(params[:id])
    @user.tutorial_mode = true
    if @user.save
      redirect_to @user, :notice => "user changed"
    else
      redirect_to @user, :notice => "user was not changed"
    end
    
  end
  
  def make_admin #releases the user from tutorial
    
    @user = User.find(params[:id])
    @user.admin = true
    if @user.save
      redirect_to @user, :notice => "user changed"
    else
      redirect_to @user, :notice => "user was not changed"
    end

  end
  
  def unmake_admin #sends the user back to tutorial
    
    @user = User.find(params[:id])
    @user.admin = false
    if @user.save
      redirect_to @user, :notice => "user changed"
    else
      redirect_to @user, :notice => "user was not changed"
    end
    
  end
  
  
  
end