class ReorderColumns < ActiveRecord::Migration[6.1]
  def up
    change_column :games, :year_released, :string, after: :genre_id
  end
end
