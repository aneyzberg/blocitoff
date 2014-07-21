class ListsController < ApplicationController
  def index
    @lists = List.all
    authorize @lists
  end

  def new
    @list = List.new
    authorize @list
  end

def create
  @list = List.new(params.require(:list).permit(:name))
  authorize @list
  if @list.save
  redirect_to lists_path, notice: 'List was saved successfully'
else
  flash[:error] = "Error creating list. Please try again."
  render :new
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
