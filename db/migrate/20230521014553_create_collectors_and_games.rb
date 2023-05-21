class CreateCollectorsAndGames < ActiveRecord::Migration[6.1]
  def change
    create_table :collectors do |t|
      t.string :name
      t.timestamps
    end
  end

  create_table :games do |t|
    t.string :title
    t.integer :console_id
    t.integer :genre_id
    t.integer :collector_id
    t.timestamps
  end

  create_table :collectors_games, id: false do |t|
    t.belongs_to :collector
    t.belongs_to :game
  end
end
