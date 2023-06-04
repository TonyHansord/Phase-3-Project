class RemoveTimestampsCollectors < ActiveRecord::Migration[6.1]
  def change
    remove_column :collectors, :created_at
    remove_column :collectors, :updated_at
  end
end
