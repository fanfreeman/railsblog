class Post < ActiveRecord::Base
  # sluggify post tiles
  extend FriendlyId
  friendly_id :title, use: :slugged
  def should_generate_new_friendly_id?
    new_record?
  end
  
  # allow tags on posts
  acts_as_taggable_on :tags
  
  # validation
  STATES = [ "Draft", "Completed", "Published", "Tossed" ]
  SELECTABLE_STATES = [ "All", "Draft", "Completed", "Published", "Tossed" ]
  validates :title, :body, presence: true
  validates :title, uniqueness: true
  validates :state, inclusion: STATES
  
  # store publishing date
  before_validation :check_publish
  
  private
  
    def check_publish
      if self.state == "Published"
        self.published_at = Time.now
      end
    end
end
