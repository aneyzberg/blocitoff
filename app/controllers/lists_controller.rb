class ListsController < ApplicationController
  def index
    @lists = current_user ? current_user.lists : List.all
    authorize @lists
  end

  def new
    @list = List.new
    authorize @list
  end

def create
  @list = List.new(params.require(:list).permit(:name))
  @list.user = current_user
  authorize @list
  if @list.save
  redirect_to lists_path, notice: 'List was saved successfully'
else
  flash[:error] = "Error creating list. Please try again."
  render :new
end
end 


   def destroy
    @list = List.find(params[:id])
    name = @topic.name

    authorize @list
    if @list.destroy
      flash[:notice] = "List was deleted successfully."
      redirect_to @lists
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
    @todo = Todo.new
    authorize @list
  end

  def edit
  end
end
