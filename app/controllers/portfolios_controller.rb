class PortfoliosController < ApplicationController
  layout 'portfolio'
  before_action :set_param, only: [:show, :update, :edit, :destroy]
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :update, :create, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end
  
  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def new
      @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def edit
    @portfolio_item = @param_id
    3.times { @portfolio_item.technologies.build}

  end
  def update
   @portfolio_item = @param_id
   
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html {redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def show
   @portfolio_item = @param_id
  end
  def destroy
  @portfolio_item = @param_id
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
    end
  end
  def set_param
    @param_id = Portfolio.find(params[:id])
  end
  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end
  
end