class FixDoseColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :doses, :name, :description
  end
end
