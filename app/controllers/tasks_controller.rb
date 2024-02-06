class TasksController < ApplicationController


    # Viewing all the tasks
    def index
        render json: Task.all, status: :ok
    end

    # Method to create a task
    def create
        task = Task.create!(task_params)
        render json: task, status: :created
    end

    # Metbod for viewing a single task

    private
    
    def task_params
        params[:status]&.capitalize!
        params.permit(:name, :description, :status)
    end

end
