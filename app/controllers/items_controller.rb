class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @delivery = Delivery.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else 
       render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end    
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :postage_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    if @item.user_id != current_user.id || @item.order != nil
    redirect_to root_path 
    end
  end

end