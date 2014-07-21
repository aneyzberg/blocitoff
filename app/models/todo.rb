class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  default_scope{ order('created_at DESC')}



def expiration
 self.created_at + 1.week
end



end
