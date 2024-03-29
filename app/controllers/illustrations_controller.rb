class IllustrationsController < ApplicationController
  load_and_authorize_resource


  def show
    @illustration = Illustration.find(params[:id])
  end

  def index
    @illustrations = Illustration.active
  end

  def uploaded
    @active_book = current_user.books.where(:status => 'active').first
    redirect_to edit_book_path (@active_book)
  end

  def new
    unless @active_book.nil?
      @type = params[:type]
      @position = params[:position]
      @illustration = Illustration.new
      @transloadit_params = {
         "auth" => { "key" => TRANSLOADIT[:auth_key] },
         "template_id" => TRANSLOADIT[:template_id],
         "redirect_url" => illustrations_url
       }
    else
      render "dashboard/cant"
    end

  end

  def create
    @illustration = Illustration.new(params[:illustration])

    illustration = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:uploads].first.symbolize_keys

    if illustration[:ext].downcase == "jpeg"
      illustration[:ext] = "jpg"
    end

    @illustration.update_attributes(
      :image_file_name        => "filename", #illustration[:name] just so check for error
      :image_content_type     => illustration[:mime],
      :image_file_size        => illustration[:size],
      :image_file_extension   => illustration[:ext].downcase,
      :image_original_id      => illustration[:original_id],
      :width                  => illustration[:meta]["width"],
      :height                 => illustration[:meta]["height"],
      :position               => params[:position],
      :tipe                   => params[:type],
      :book_id                => current_user.books.where(:status => 'active').first.id,
      :deleted                => false,
      :status                 => "review",
      :draft                  => params[:draft]
    )

    if @illustration.save
      redirect_to @illustration, :notice => 'Success! Your image has been uploaded'
    else
      render new_illustration_path, :alert => 'Error uploading. Please try again in one hour. If you keep having a problem, write us at help@pictorical.com'
    end
  end

  def destroy
    @illustration = Illustration.find(params[:id])
    @illustration.deleted = true
    @illustration.save
    unless current_user.admin?
      @active_book = current_user.books.where(:status => 'active').first
      redirect_to edit_book_path(@active_book), :notice => 'Success! Your image has been deleted'
    else
      redirect_to edit_illustration_path(@illustration), :notice => 'Success! Your image has been deleted'
    end
  end

  def edit
    @illustration = Illustration.find(params[:id])
  end

  def update
    @illustration = Illustration.find(params[:id])
    if @illustration.update_attributes(params[:illustration])
      # Sends the illustration feedback email once every 6 hours
      user = @illustration.user
      last = user.last_illustration_mail_sent_at || 0

      if (Time.now - last).to_f > 6.hours.ago.to_f
        mail = Notifications.illustration_feedback(@illustration)
        if mail.deliver #sends the mail
          #updates the last illustration mail sent time
          user.last_illustration_mail_sent_at = Time.now
          user.save
        end
      end

      redirect_to illustrations_path + "?status=review", :notice => 'Illustration was successfully updated.'

    else
      render :action => "edit", :notice => 'Illustration was not updated'
    end
  end



end