class Portfolio < ApplicationRecord
  has_many :technologies
  validates_presence_of :title,:body, :main_image, :thumb_image
  include Placeholder
  accepts_nested_attributes_for :technologies,
                                      reject_if: lambda { |attrs| attrs['name'].blank?}

  
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
