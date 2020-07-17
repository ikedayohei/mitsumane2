class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :upadate, :destroy]

  def show
    @estimates = @user.estimates.estimate.page(params[:page]).per(6)
    @number = @user.estimates.count(:id)
    @sell_price_total = @user.estimates.sum(:sell_price_total)
    @profit_total = @user.estimates.sum(:profit_total)
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :company_name)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
