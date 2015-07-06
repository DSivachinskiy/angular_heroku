class ListsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :upvote, :destroy]
	def index
    respond_with List.all
  end

  def create
    respond_with List.create(list_params.merge(user_id: current_user.id))
  end

  def show
    respond_with List.find(params[:id])
  end

  def update
  	list = List.find(params[:id])
  	
    list.update(list_params)
    respond_with list
    
  end
  def destroy
    list = List.find(params[:id])
    
    list.destroy
    respond_with list
  end
  private
  def list_params
    params.require(:list).permit(:title)
  end
end
