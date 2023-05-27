class Collector < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_many :consoles, through: :games

  def list_console_names
    self.consoles.uniq.map do |console|
      console.name
    end
  end

  def add_game(title, console_id, genre_id)
    self.games << Game.create(title: title, console_id: console_id, genre_id: genre_id)
  end
end
