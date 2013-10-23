class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :user_id
      t.integer :gratitude_id

      t.timestamps
    end
  end
end
