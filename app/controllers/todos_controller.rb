class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def edit
  
  end

  def create
   @todos = Todo.all 
   @todo = Todo.new(params.require(:todo).permit(:description))
   if @todo.save
   flash[:notice] = "Todo was saved"
   redirect_to @todo
   else 
   flash[:error] = "There was an error saving the todo. Please try again"
   render :new
   end
  end



end
