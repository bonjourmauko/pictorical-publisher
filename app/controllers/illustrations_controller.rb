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
    @illustration = Illustration.new()
    @transloadit_params = {
       "auth" => { "key" => TRANSLOADIT[:auth_key] },
       "template_id" => TRANSLOADIT[:template_id],
       "redirect_url" => illustrations_url
     }
  end
  
  def create
    @inline_illustration = Illustration.new(params[:inline_illustration])
    
    inline_illustration = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:uploads].first.symbolize_keys
    
    @inline_illustration.update_attributes(
      :inline_file_name        => inline_illustration[:name], 
      :inline_content_type     => inline_illustration[:mime], 
      :inline_file_size        => inline_illustration[:size], 
      :inline_file_extension   => inline_illustration[:ext].downcase,
      :inline_original_id      => inline_illustration[:original_id],
      :inline_original_width   => inline_illustration[:meta]["width"],
      :inline_original_height  => inline_illustration[:meta]["height"]
    )
    
     @inline_illustration.update_attributes(
      :inline_position => params[:inline_position],
      :book_id => current_user.books.where(:status => 'active').first.id
      )
        
    if @inline_illustration.save
      @active_book = current_user.books.where(:status => 'active').first
      redirect_to edit_book_path(@active_book), :notice => 'Success! Your image has been uploaded'
    else
      render new_illustration_path, :alert => 'error!'
    end
    
  end
  
end