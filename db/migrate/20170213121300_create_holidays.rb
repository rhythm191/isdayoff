class CreateHolidays < ActiveRecord::Migration[5.0]
  def change
    create_table :holidays do |t|
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.string :reason, null: false
      t.string :country

      t.timestamps
    end
  end
end
