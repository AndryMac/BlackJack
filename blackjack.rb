require_relative "deck"
require_relative "card"
require_relative "hand"
require_relative "user"
require_relative "diller"

h = Hand.new
h.deal_cards
p h = h.score(h.cards)
