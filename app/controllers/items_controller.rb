class ItemsController < ApplicationController
  before_action :set_type 
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = @type.items
  end

  def show
    
  end

  def new
    
    @item = @type.items.new
    render partial: "form"
  end

  def create
    @item = @type.items.new(item_params)
    if @item.save
      redirect_to type_items_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @item.update(item_params)
      redirect_to [@type, @item]
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to type_items_path
  end
end

  private
  def set_type
    @type = Type.find(params[:type_id])
  
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
   params.require(:item).permit(:name, :price, :available)
  end

