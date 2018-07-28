class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @usertasks = current_user.usertasks
  end
end
