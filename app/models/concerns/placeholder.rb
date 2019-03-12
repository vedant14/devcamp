module Placeholder
  extend ActiveSupport::Concern

  def self.set_image(height: , width:)
   "https://via.placeholder.com/#{height}x#{width}"
  end
end  

