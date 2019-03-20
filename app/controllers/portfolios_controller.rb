class PortfoliosController < ApplicationController
  layout 'portfolio'
  before_action :set_param, only: [:show, :update, :edit, :destroy]
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :update, :create, :edit]}, company_admin: :all

  def index
    @portfolio_items = Portfolio.all
  end
  
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  
  def new
      @portfolio_item = Portfolio.new
      3.times { @portfolio_item.technologies.build}
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
                                      technologies_attributes: [:name])
  end
  
end