class IllustrationsController < ApplicationController
  
  def index
    @illustrations = Illustration.all
  end
  
  def new
    @type = params[:type]
    @position = params[:position]
    @book_id = params[:book]
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
      :book_id => params[:book_id]
      )
        
    if @inline_illustration.save
      redirect_to illustrations_path, :notice => 'success!'
    else
      render new_illustration_path
    end
    
  end
  
end