class Portfolio < ApplicationRecord
  validates_presence_of :title,:body, :main_image, :thumb_image
  include Placeholder
  
  def self.angular
    where(subtitle: "Angular")
  end
  scope :ruby_on_rails_items, -> {where(subtitle: "Ruby on Rails")}
  
  after_initialize :set_defaults
  
  def set_defaults
  self.main_image ||= Placeholder.set_image(height:600,width:400)
  self.thumb_image ||= Placeholder.set_image(height:350,width:200)
  end
end  
