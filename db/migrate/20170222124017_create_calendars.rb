class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.string :country, null: false
      t.string :locale, null: false
      t.string :calendar_id, null: false

      t.timestamps
    end

    add_index :calendars, [:country, :locale], unique: true
  end
end
