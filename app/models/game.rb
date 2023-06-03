class Game < ActiveRecord::Base
  has_and_belongs_to_many :collectors
  belongs_to :genre
  belongs_to :console
end

def games_collectors
  self.collectors
end
