class Card < ActiveRecord::Base
  has_many :card_decks
  has_many :desk, through: :card_decks

  validates :question, :answer, presence: true
end
