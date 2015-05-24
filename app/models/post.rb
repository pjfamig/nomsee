class Post < ActiveRecord::Base
  validates :photo,  presence: true
  default_scope -> { order(created_at: :desc) }  
end
