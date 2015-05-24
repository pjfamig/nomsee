class Post < ActiveRecord::Base
  validates :photo,  presence: true
  default_scope -> { order(created_at: :desc) } 
  mount_uploader :photo, PhotoUploader 
  validate  :photo_size
  
  
  private

    # Validates the size of an uploaded picture.
    def photo_size
      if photo.size > 5.megabytes
        errors.add(:photo, "should be less than 5MB")
      end
    end

end
