class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :excavators, :sity, :city
  end
end
