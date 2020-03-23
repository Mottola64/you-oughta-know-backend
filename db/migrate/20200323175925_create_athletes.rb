class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string  :name
      t.string  :description
      t.date  :birthdate
      t.timestamps
    end
  end
end
