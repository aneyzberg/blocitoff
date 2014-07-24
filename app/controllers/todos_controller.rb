class TodosController < ApplicationController
  before_action :set_list

  def create
   @todo = current_user.todos.build(params.require(:todo).permit(:description))
   @todo.list = @list
   authorize @todo
   if @todo.save
    flash[:notice] = "Todo was saved"
   else 
    flash[:error] = "There was an error saving the todo. Please try again"
   end
   redirect_to @list
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.list = @list
    authorize @todo

    if @todo.destroy
      flash[:notice] = "Todo was deleted sucessfully"      
    else 
      flash[:error] = "There was an error deleting the Todo."      
    end
    
    redirect_to @list
  end

  private

  def todo_params
    params.require(:todo).permit(:description)

  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
