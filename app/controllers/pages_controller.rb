class PagesController < ApplicationController
  def home
    @posts = blogs.all
  end

  def about
  end

  def contact
  end
end
