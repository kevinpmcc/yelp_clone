class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @user = current_user
    @restaurant = @user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.belongs_to_user?(@restaurant, @user)
      @restaurant.update(restaurant_params)
    else
      flash[:notice] = "You cannot edit another user's restaurant."
    end
    redirect_to restaurants_path
  end

  def destroy
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.belongs_to_user?(@restaurant, @user)
      @restaurant.destroy
      flash[:notice] = 'Restaurant deleted successfully'
    else
      flash[:notice] = "You cannot delete another user's restaurant."
    end
    redirect_to restaurants_path
  end
end
