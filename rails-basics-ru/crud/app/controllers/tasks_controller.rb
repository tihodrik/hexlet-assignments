# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'New task was successfully created'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be created'
      render :new
    end
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.update(task_params)
      flash[:success] = 'New task was successfully updated'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be updated'
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.destroy
      flash[:success] = 'Task was successfully destroyed'
      redirect_to tasks_path
    else
      flash[:failure] = 'Task cannot be destroyed'
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
