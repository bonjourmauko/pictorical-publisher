class InvitationsController < ApplicationController
  
  def index
    @invitations = Invitation.sorted.all
  end

  def show
    @invitation = Invitation.find(params[:id])
  end
  
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    
      if @invitation.save
        redirect_to @invitation, :notice => 'Invitation was successfully created.'
      else
        render :action => "new"
      end
    
  end
  
  def edit
    @invitation = Invitation.find(params[:id])
  end
  
  def update
    
    @invitation = Invitation.find(params[:id])
    
    if @invitation.update_attributes(params[:invitation])
      redirect_to @invitation, :notice => 'Invitation was successfully updated.'
    else
      render :action => "edit"
    end
    
  end
  
  def destroy
    @invitation.destroy
  end
  
  
  
  
  
end
