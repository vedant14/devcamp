class Blog < ApplicationRecord
  enum status: {published: 1, draft: 0}
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :body, :topic_id
  
  def should_generate_new_friendly_id?
   title_changed?
  end
  
  def self.published_by_order
    order("updated_at DESC")
  end
  
  belongs_to :topic, optional: true  
  has_many :comments, dependent: :destroy

end
