class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
