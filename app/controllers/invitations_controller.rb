class InvitationsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_invitation_by_id, :only => [:show, :edit, :update]
  # actions where artists have access to
  # ninguna


  #def index
  #  @invitations = Invitation.sorted.all
  #end

  def index

    redeemed = params[:redeemed]

    if redeemed.nil? || redeemed == ""

      @invitations = Invitation.sorted.all

    elsif redeemed == "yes" || redeemed == "YES"

      #fuck
      @invitations = Invitation.not_nil.sorted

    else

      @invitations = Invitation.sorted.find_all_by_redeemed_at(nil)

    end



  end



  def show
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
  end

  def update
    if @invitation.update_attributes(params[:invitation])
      redirect_to @invitation, :notice => 'Invitation was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @invitation.destroy
    redirect_to invitations_path
  end

  private

  def find_invitation_by_id
    @invitation = Invitation.find(params[:id])
  end
end
