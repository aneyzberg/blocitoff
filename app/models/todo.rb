class Todo < ActiveRecord::Base
  belongs_to :user



def expiration
 self.created_at + 1.week
end



end
