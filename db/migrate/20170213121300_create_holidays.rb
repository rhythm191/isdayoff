class CreateHolidays < ActiveRecord::Migration[5.0]
  def change
    create_table :holidays do |t|
      t.date :date, null: false
      t.string :reason, null: false
      t.string :country

      t.timestamps
    end

    add_index :holidays, :date, unique: true
  end
end
