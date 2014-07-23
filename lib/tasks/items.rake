namespace :items do

  desc "Removes items that are a week old"
  task delete: :environment do
    Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end