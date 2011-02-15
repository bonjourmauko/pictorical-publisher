class ArtistsController < ApplicationController
  
  def edit
    @artist = Artist.find(params[:id])
  end

end
