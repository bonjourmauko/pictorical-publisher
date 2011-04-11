class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :find_user_by_id, :only => [:show, :mature, :demature, :make_admin, :unmake_admin]

  def index
    @users = User.sorted.all
  end

  def show
  end
  
  def edit
    @transloadit_params = {
       "auth" => { "key" => TRANSLOADIT[:auth_key] },
       "template_id" => TRANSLOADIT[:template_id],
       "redirect_url" => illustrations_url
     }
  end

  def update
    face = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:uploads].first.symbolize_keys
    
    if face[:ext].downcase == "jpeg"
      face[:ext] = "jpg"
    end
    
    @user.update_attributes(
      :face_file_name        => face[:name], 
      :face_content_type     => face[:mime], 
      :face_file_size        => face[:size], 
      :face_file_extension   => face[:ext].downcase,
      :face_original_id      => face[:original_id],
      :width                 => face[:meta]["width"],
      :height                => face[:meta]["height"]
    )
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