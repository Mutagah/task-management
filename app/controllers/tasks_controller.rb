class TasksController < ApplicationController

    # Creating a task
    def create
        task = Task.create!(task_params)
        render json: task, status: :created
    end

    # Viewing all the tasks
    def index
        render json: Task.all, status: :ok
    end

    # viewing a single task
    def show
        render json: find_task, status: :ok
    end

    # updating the status of a task
    def update
        task = find_task
        task.update!(update_task_params)
        render json: task,status: :accepted
    end
    
    # getting the tasks via status of the task
    def status
        task = Task.where(status: params[:status].capitalize)
        if task.length > 0
            render json: tasks, status: :ok
        else
            render json: {error: "No tasks with #{params[:status]} status found"}, status: :not_found
        end
    end

    # deleting all the tasks
    def tasks_delete
        Task.destroy_all
        head :no_content
    end

    # deleting a task by an Id
    def destroy
        find_task.destroy!
        head :no_content
    end

    private
    
    def task_params
        params[:status]&.capitalize!
        params.permit(:name, :description, :status)
    end
    
    def find_task
        Task.find(params[:id])
    end

    def update_task_params
        params[:status]&.capitalize!
        params.permit(:status)
    end
    
end
