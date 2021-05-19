class ImageValidator < ActiveModel::EachValidator
  MAX_IMAGE_MEGABYTES = 20
  def validate_each(record, attribute, value)
    unless value.blob.content_type.in?(%('image/jpeg image/png'))
      record.errors.add(attribute, "はjpeg,jpgまたはpng形式でアップロードしてください")
    end
    if value.blob.byte_size >= MAX_IMAGE_MEGABYTES.megabytes
      record.errors.add(attribute, "は#{MAX_IMAGE_MEGABYTES}MB以下でアップロードしてください")
    end
  end
end
