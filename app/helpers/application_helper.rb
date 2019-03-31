module ApplicationHelper

  def login_helper class_type = ''
      if current_user.is_a?(GuestUser)
        (link_to "Login", new_user_session_path, class: class_type)+ 
        (" ".html_safe )+
        (link_to "Register", new_user_registration_path, class: class_type)
      else
        link_to "Logout", destroy_user_session_path, method: :delete, class: class_type
      end 
  end

  def source_helper(layout_name)
    if session[:source]
      greeting ="Thanks for visiting us from #{session[:source]} and you are seeing the #{layout_name} layout."
      content_tag(:p, greeting, class: "source_greetings")
    end
  end
  
  def copyright_generator
    VedantViewTool::Renderrer.set_copy_right "Vedant","All rights Reserved"
  end 
  
  
  def nav_items
    [
      {
        url: root_path,
        title:'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact Me'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolios'
      },
      {
        url: tech_news_path,
        title: 'Tech-news'
      }
    ]
  end
  
  def nav_helper class_type, tag_type
    nav_links= ''
    
    nav_items.each do |item|
      nav_links<< "<#{tag_type}><a href='#{item[:url]}' class='#{class_type} #{active? item[:url]}'> #{item[:title]} </a></#{tag_type}>"
    end
    nav_links.html_safe
  end
  
  def active? path
  "active" if current_page? path
  end
  
  
  def alerts
    alert = ( flash[:alert] || flash[:error] || flash[:notice])  
    
    alert_generator alert
  end
  
  def alert_generator msg
    js add_gritter(msg, title: "Alert!", :time => 1500)
  end
end