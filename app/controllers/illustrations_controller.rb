class IllustrationsController < ApplicationController
  
  def index
    @illustrations = Illustration.all
  end
  
  def uploaded
    @active_book = current_user.books.where(:status => 'active').first
    redirect_to edit_book_path (@active_book)
  end
  
  def new
    @type = params[:type]
    @position = params[:position]
    @illustration = Illustration.new
    @transloadit_params = {
       "auth" => { "key" => TRANSLOADIT[:auth_key] },
       "template_id" => TRANSLOADIT[:template_id],
       "redirect_url" => illustrations_url
     }
  end
  
  def create
    @illustration = Illustration.new(params[:illustration])
    
    illustration = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:uploads].first.symbolize_keys
    
    @illustration.update_attributes(
      :image_file_name        => illustration[:name], 
      :image_content_type     => illustration[:mime], 
      :image_file_size        => illustration[:size], 
      :image_file_extension   => illustration[:ext].downcase,
      :image_original_id      => illustration[:original_id],
      :width                  => illustration[:meta]["width"],
      :height                 => illustration[:meta]["height"],
      :position               => params[:position],
      :type                   => params[:type],
      :book_id                => current_user.books.where(:status => 'active').first.id
    )
        
    if @illustration.save
      @active_book = current_user.books.where(:status => 'active').first
      redirect_to edit_book_path(@active_book), :notice => 'Success! Your image has been uploaded'
    else
      render new_illustration_path, :alert => 'Error!'
    end
    
  end
  
end