class Api::V1::TasksController < ApplicationController
    # def index
    #     render json: Task.all
    # #   render json: {
    # #     example_key: {
    # #       example_nested_key: "It worked!"
    # #     },
    # #     example_array_key: [
    # #       "Array item 1", "Array item 2"
    # #     ]
    # #   }
    #     # tasks = Task.all
    #     # render json: TaskSerializer.format_tasks(tasks)
    # end
    
    def index
        tasks = Task.all
        render json: TaskSerializer.format_tasks(tasks)
    end

    def show
        # require 'pry'; binding.pry
        render json: Task.find(params[:id])
    end

    def create
        # binding.pry
        render json: Task.create(task_params)
    end

    def update
        render json: Task.update(params[:id], task_params)
    end

    def destroy
        render json: Task.delete(params[:id])
    end

    private

    def task_params
        params.require(:task).permit(:title, :description)
    end

    # def update
    #     render json: Task.update(params[:id], task_params)
    # end
end
