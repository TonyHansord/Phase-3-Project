class RemoveYearReleased < ActiveRecord::Migration[6.1]
  def change
    remove_column :consoles, :year_released
    add_column :games, :year_released, :string
  end
end
