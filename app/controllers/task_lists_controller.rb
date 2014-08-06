class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def new
    @task_list ||= TaskList.new
  end

  def create
    @task_list = TaskList.new(params.require(:task_list).permit!)

    if @task_list.save
      redirect_to root_url, flash: {success: "You have successfully added a task"}
    else
      render :new
    end
  end
end