class EstimatesController < ApplicationController
  before_action :authenticate_user!,  except:[:index]
  before_action :set_estimate, only: [:show, :edit, :update, :destroy]

  def index
    @estimate = Estimate.new
  end

  def new
    @estimates = Estimate.includes(:user).estimate.page(params[:page]).per(6)
    @numbers = Estimate.count(:id)
    @sell_price_totals = Estimate.sum(:sell_price_total)
    @profit_totals = Estimate.sum(:profit_total)
  end

  def create
    @estimate = Estimate.new(estimate_params)
    if @estimate.save
      redirect_to new_estimate_path
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    if @estimate.update(estimate_params)
      redirect_to new_estimate_path(@estimate)
    else
      render :edit
    end
  end

  def destroy
   if @estimate.destroy
    redirect_to root_path
   else
    render :index
   end
  end

  def search
    @estimates = Estimate.search(params[:search])
    @q = Estimate.ransack(params[:q])
    @search_estimate = Estimate.ransack(params[:q]) 
    @result = @search_estimate.result.page(params[:page])
  end

  private 
  def estimate_params
    params.require(:estimate).permit(:customer,:get,:deadline,:name,:figure_number,:make,:metal,:start, :use, :quantity, :sell_price, :purchase_price, :profit, :sell_price_total, :profit_total, :remark, :probability_id, :status_id).merge(user_id: current_user.id)
  end

  def set_estimate
    @estimate = Estimate.find(params[:id])
  end
end
