class CreateGratitudes < ActiveRecord::Migration
  def change
    create_table :gratitudes do |t|
      t.string :day_id
      t.text :body
      t.integer :order

      t.timestamps
    end
  end
end
