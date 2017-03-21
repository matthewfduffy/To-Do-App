class TasksController < ApplicationController
  def index
      @tasks = Task.all
      @to_do = @tasks.where(["status = ?", "To Do"])
      @doing = @tasks.where(["status = ?", "Doing"])
      @done = @tasks.where(["status = ?", "Done"])
      render layout: "three_column"
  end

  def show
      @task = Task.find(params[:id])
  end

  def new
      @task = Task.new
  end

  def update
      task = Task.find(params[:id])
      unless task.status == "To Do"
          task.status = "Done"
      else
          task.status = "Doing"
     end
     task.save
     redirect_to tasks_path
  end

def destroy
    Task.find(params[:id]).destroy
    redirect_to :root
 end
  def create
      @task = Task.new(task_params)
      @task.save

      redirect_to tasks_path
  end

  private
    def task_params
        params.require(:task).permit(:title, :description, :status)
    end

end
