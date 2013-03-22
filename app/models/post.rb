class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def should_generate_new_friendly_id?
    new_record?
  end
  
  STATES = [ "Draft", "Completed", "Published", "Tossed" ]
  
  validates :title, :body, presence: true
  validates :title, uniqueness: true
  validates :state, inclusion: STATES
  
  before_save :check_publish
  
  private
  
    def check_publish
      self.published_at = Date.today
    end
end
