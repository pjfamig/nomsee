class Post < ActiveRecord::Base
  validates :photo,  presence: true  
end
