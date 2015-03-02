class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(colors_params)
    if @color.save
      flash[:notice] = "Color was saved successfully!"
      redirect_to colors_path
    else
      render :new
    end
  end

  def show
    @color = Color.find(params[:id])
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    if @color.update(colors_params)
      flash[:notice] = "Your color was updated successfully!"
      redirect_to colors_path
    else
      render :edit
    end
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    flash[:notice] = "The color was deleted successfully"
    redirect_to colors_path
  end

  private

  def colors_params
    params.require(:color).permit(:name, :popularity)
  end
end
