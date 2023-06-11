class Console < ActiveRecord::Base
  has_many :games
  has_many :collectors, through: :games

  def list_collectors
    self.collectors.each do |collector|
      puts collector.name
    end
  end
end
