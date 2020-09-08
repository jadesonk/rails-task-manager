class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # take all the data from params and create a new restaurant
    @task = Task.new(task_params) # taking in params
    # save it to the database
    @task.save
    # redirect the user
    redirect_to tasks_path # keyword for rails 'redirect_to'
    # redirect_to restaurant_path(@resto)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
