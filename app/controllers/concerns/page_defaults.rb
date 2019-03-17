module PageDefaults 
  extend ActiveSupport::Concern
  included do
     before_action :default_vals
  end
  def default_vals
    @page_title = "My portfolio website"
    @seo_keywords = "portfolio website"
  end
end