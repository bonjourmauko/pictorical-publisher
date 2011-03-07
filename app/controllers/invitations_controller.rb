class InvitationsController < ApplicationController
  load_and_authorize_resource
  # actions where artists have access to
  # ninguna
  
  
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
    @invitation.secret = Digest::SHA1.hexdigest("#{Time.now.to_s}")[0,10]
      if @invitation.save
        mail = Notifications.create_invitation(@invitation, request.host)
        mail.deliver
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
