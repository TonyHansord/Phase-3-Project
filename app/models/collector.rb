class Collector < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_many :consoles, through: :games

  def list_console_names
    self.consoles.uniq.map do |console|
      console.name
    end
  end

  def add_game(title, console, genre)
    self.games << Game.create(title: title, console_id: Console.find_by(name: console).id, genre_id: Genre.find_by(name: genre).id)
  end
end
