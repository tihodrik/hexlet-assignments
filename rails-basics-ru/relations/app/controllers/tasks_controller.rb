# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
    @users = User.all
    @statuses = Status.all
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task), notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.destroy
      redirect_to root_path, notice: 'Status was successfully destroyed.'
    else
      render task_path(@task), status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :user_id, :status_id)
  end
end
