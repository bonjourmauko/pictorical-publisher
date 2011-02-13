class TextsController < ApplicationController
  def index
    @texts = Text.all
  end

  def show
  end

end
