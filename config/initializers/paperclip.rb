Paperclip.interpolates :original_id do |attachment, style|
  attachment.instance.send("#{attachment.name}_original_id")
end

