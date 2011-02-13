class TextsController < ApplicationController
  def index
    @texts = Text.all
  end

  def show
    @text = Text.first #for test
  end

end
