class IllustrationsController < ApplicationController
  
  def index
    @illustrations = Illustration.all
  end
  
  def new
    @illustration = Illustration.new
    @transloadit_params = {
       "auth" => { "key" => TRANSLOADIT[:auth_key] },
       "template_id" => TRANSLOADIT[:template_id],
       "redirect_url" => illustrations_url
     }
  end
  
  def create
    @illustration = Illustration.new(params[:illustration])
    
    brayatan = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:uploads].first.symbolize_keys
    
    @illustration.update_attributes(
      :illustration_file_name => brayatan[:name], 
      :illustration_content_type => brayatan[:mime], 
      :illustration_file_size => brayatan[:size], 
      :illustration_unique_prefix => brayatan[:id].insert(2, '/')
    )
    
    if @illustration.save
      redirect_to illustrations_path, :notice => 'sup nigger'
    else
      render new_illustration_path
    end
    
  end
  
end