class Console < ActiveRecord::Base
  has_many :games
  has_many :collectors, through: :games
end
