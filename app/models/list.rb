class List < ActiveRecord::Base
  has_many :todos
  belongs_to :user

  default_scope{ order ('created_at DESC')}


end
