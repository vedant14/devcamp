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
end
