class TypesController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @types = Type.all
  end

  def show
  end

  def new
    @type = Type.new
    render partial: "form"
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to types_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @type.update(type_params)
      redirect_to types_path
    else
      render :edit
    end
  end

  def destroy
    @type.destroy
    redirect_to types_path
  end

  private
  def type_params
    params.require(:type).permit(:name)
  end

  def find_params
    @type = Type.find(params[:id])
  end

end
