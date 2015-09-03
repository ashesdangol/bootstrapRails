class TodosController < ApplicationController
	def index
		@todos= Todo.all

	end

	def show
		@todo= Todo.find(params[:id])
		
	end

	def edit
		@todo= Todo.find(params[:id])
		
	end

	def update
		@todo= Todo.find(params[:id])
		if @todo.update_attributes(todo_params)
			redirect_to :action => :index

		else
			render 'edit'
		end
	end
	def destroy
		@todo= Todo.find(params[:id])
		@todo.destroy
		flash[:danger] = 'List was successfully deleted.'
		redirect_to :action => :index
	end

	def new
		@todo=Todo.new
	end

	def create
		@todo=Todo.new(todo_params)

		if todo_params[:title].present? && todo_params[:notes].present?

			if @todo.save
				flash[:success] = 'List was successfully created.'
				redirect_to :action => :index 
			end
			
		else
			flash[:danger] = 'There was a problem creating .'
			render 'new'
		end
		
	end

	def login

	end

	

	private

		def todo_params
			params.require(:todo).permit(:title, :notes)
		end
end
