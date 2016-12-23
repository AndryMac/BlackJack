require_relative "deck"
require_relative "card"
require_relative "hand"
require_relative "user"
require_relative "diller"
require_relative "player"
require_relative "game"

=begin
h = Hand.new
h.deal_cards
p h = h.score(h.cards)


d = Diller.new
p d
=end
g = Game.new
g.start_game
