class TranslatorsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_translator_by_id, :only => [:show, :edit, :update]

  def index
    @translators = Translator.sorted.all
  end

  def new
    @translator = Translator.new
  end

  def create
    @translator = Translator.new(params[:translator])
    if @translator.save
      redirect_to new_text_path, :notice => 'Translator was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if @translator.update_attributes(params[:translator])
      redirect_to @translator, :notice => 'Translator was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @translator.destroy
    redirect_to translators_path
  end

  private

  def find_translator_by_id
    @translator = Translator.find(params[:id])
  end
  
end