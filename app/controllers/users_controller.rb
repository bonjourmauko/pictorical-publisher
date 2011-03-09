class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :find_user_by_id, :only => [:show, :mature, :demature, :make_admin, :unmake_admin]

  def index
    @users = User.sorted.all
  end

  def show
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
    @user.tutorial_mode = true
    if @user.save
      redirect_to @user, :notice => "user changed"
    else
      redirect_to @user, :notice => "user was not changed"
    end
  end

  def make_admin #releases the user from tutorial
    @user.admin = true
    if @user.save
      redirect_to @user, :notice => "user changed"
    else
      redirect_to @user, :notice => "user was not changed"
    end
  end

  def unmake_admin #sends the user back to tutorial
    @user.admin = false
    if @user.save
      redirect_to @user, :notice => "user changed"
    else
      redirect_to @user, :notice => "user was not changed"
    end
  end

  private

  def find_user_by_id
    @user = User.find(params[:id])
  end

end