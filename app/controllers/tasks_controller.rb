class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new()
  end

  def create
    new_task = Task.create(tasks_params)
    redirect_to task_path(new_task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to task_path(@task)
    # redirect to the newly updated instance of task page
  end

  def destroy
    task_to_destroy = Task.find(params[:id])
    task_to_destroy.destroy
    redirect_to task_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :status)
  end
end
