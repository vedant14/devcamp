class Blog < ApplicationRecord
  enum status: {published: 1, draft: 0}
  extend FriendlyId
  friendly_id :title, use: :slugged
  
 def should_generate_new_friendly_id?
   title_changed?
 end

end
