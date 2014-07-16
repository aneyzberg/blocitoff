class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
    authorize @todo
  end

  def edit
  @todo = Todo.find(params[:id])
  authorize @todo
  end

  def update
    @todo = Todo.find(params[:id])
    authorize @todo
    if todo.update_attributes(todo_params)
      redirect_to @todo
    else
    flash[:error] = "Error saving Todo. Please try again."
    render edit
    end
  end

  def create
   @todo = current_user.todos.build(params.require(:todo).permit(:description))
   authorize @todo
   if @todo.save
   flash[:notice] = "Todo was saved"
   redirect_to todos_path
   else 
   flash[:error] = "There was an error saving the todo. Please try again"
   render :new
   end
  end

def todo_params
  params.require(:todo).permit(:description)

end


end
