class ListPolicy < ApplicationPolicy


  def index?
    user.present? && (record.user == user)
  end

  def create?
    user.present? 
  end

  def update?
   create?
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
    authorize @list
  end

end