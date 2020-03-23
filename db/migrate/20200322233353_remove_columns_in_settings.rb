class RemoveColumnsInSettings < ActiveRecord::Migration[6.0]
  def change
    remove_column :settings, :name
    remove_column :settings, :email
  end
end
