class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def should_generate_new_friendly_id?
    new_record?
  end
  
  validates :title, :body, :state, presence: true
  validates :title, uniqueness: true
end
