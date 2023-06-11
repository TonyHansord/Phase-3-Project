class RemoveTimestampsConsoles < ActiveRecord::Migration[6.1]
  def change
    remove_column :consoles, :created_at
    remove_column :consoles, :updated_at
  end
end
