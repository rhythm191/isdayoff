class AddLocaleToHoliday < ActiveRecord::Migration[5.0]
  def change
    add_column :holidays, :locale, :string
    add_index :holidays, [:date, :country, :locale]
  end
end
