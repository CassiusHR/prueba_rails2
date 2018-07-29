class UsertasksController < ApplicationController
  before_action :authenticate_user!
  def create
    @task = Task.find(params[:task_id])
    @usertask = Usertask.find_or_create_by(task: @task, user: current_user)
    @usertask.update(completed: !@usertask.completed)
    if @usertask.save
      redirect_to tasks_path, notice: 'La tarea ha sido completada'
    else
      redirect_to tasks_path
    end
  def index
    @tasks = Task.all
    @usertasks = current_user.usertask
  end
end
end