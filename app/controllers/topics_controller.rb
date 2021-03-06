class TopicsController < ApplicationController
  layout 'blog'
  before_action :sidebar

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.page(params[:page]).per(5).published_by_order
    else
      @blogs = @topic.blogs.published.page(params[:page]).per(5).published_by_order
    end
  end

private 
  def sidebar
    @side_topics = Topic.with_blogs
  end
end