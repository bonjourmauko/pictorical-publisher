class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :find_user_by_id, :only => [:show, :mature, :demature, :make_admin, :unmake_admin]

  def index
    @users = User.sorted.all
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'User was successfully updated.'
    else
      render :action => "edit"
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

  def facepic
    
    @transloadit_params = {
       "auth" => { "key" => TRANSLOADIT[:auth_key] },
       "template_id" => TRANSLOADIT[:facepic_template_id],
       "redirect_url" => add_facepic_url(:id => @user.id)
     }
    
  end



  def add_facepic
    
    facepic = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:uploads].first.symbolize_keys
    
    if facepic[:ext].downcase == "jpeg"
      facepic[:ext] = "jpg"
    end
    
    error = []
    error << "Error: The size of the image has to be 600px wide by 800px tall." if facepic[:meta]["width"] != 600 || facepic[:meta]["height"] != 800
    
    if error.empty?
    
      @user.update_attributes(
        :face_file_name        => "filename", #illustration[:name] just so check for error
        :face_content_type     => facepic[:mime], 
        :face_file_size        => facepic[:size], 
        :face_file_extension   => facepic[:ext].downcase,
        :face_original_id      => facepic[:original_id],
        :face_width            => facepic[:width],
        :face_height           => facepic[:height]
      )
        
      if @user.save
        redirect_to edit_user_registration_path, :notice => "Success! Your image has been uploaded"
        #render :text => facepic[:original_id]
      else
        redirect_to facepic_path, :alert => 'Error uploading. Please try again in one hour. If you keep having a problem, write us at help@pictorical.com'
      end
    else
        redirect_to facepic_path, :alert => error.join(" / ")
    end
  end




  private

  def find_user_by_id
    @user = User.find(params[:id])
  end

end