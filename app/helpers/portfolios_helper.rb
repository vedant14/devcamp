module PortfoliosHelper
  def set_image(height: , width:)
   "https://via.placeholder.com/#{height}x#{width}"
  end
  
  def portfolio_img img, type
    if img.model.main_image? || img.model.thumb_image?
      img.to_s
    elsif type == 'thumb'
      set_image(height: '350', width: '200')
    elsif type == 'main'
      set_image(height: '600', width: '400')
    end 
  end
end
