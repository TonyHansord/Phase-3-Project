class RemoveTimestamps < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :created_at
    remove_column :games, :updated_at
  end
end
