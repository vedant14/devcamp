class Portfolio < ApplicationRecord
  has_many :technologies
  validates_presence_of :title,:body
  accepts_nested_attributes_for :technologies,  allow_destroy: true,
                                      reject_if: lambda { |attrs| attrs['name'].blank?}

  
  mount_uploader :main_image, PortfolioUploader
  mount_uploader :thumb_image, PortfolioUploader
  
  def self.by_position
    order("position ASC")
  end
  def self.angular
    where(subtitle: "Angular")
  end
  
  scope :ruby_on_rails_items, -> {where(subtitle: "Ruby on Rails")}
  
end  
