class CardDeck < ActiveRecord::Base
  belongs_to :card
  belongs_to :deck

  validates :card, :deck, presence: true
end
