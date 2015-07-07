class TasksController < ApplicationController
	load_and_authorize_resource

  def create
    list = List.find(params[:list_id])
    task = list.tasks.create(task_params.merge(user_id: current_user.id))
    respond_with list, task
  end
  
  def update
  	list = List.find(params[:list_id])
  	task = list.tasks.find(params[:id])
    task.update(task_params)
    respond_with list, task
    
  end
  def upvote
    list = List.find(params[:list_id])
    task = list.tasks.find(params[:id])
    task.increment!(:upvotes)

    respond_with list, task
  end
  def destroy
    list = List.find(params[:list_id])
    task = list.tasks.find(params[:id])
    task.destroy
    respond_with list, task
  end
  private
  def task_params
    params.require(:task).permit(:body, :upvotes)
  end
end
