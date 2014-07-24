class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
