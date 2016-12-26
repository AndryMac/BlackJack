class User

  START_BANK = 100
  MAX_COUNT_CARDS = 3
  BET_AMOUNT = 10

  attr_reader :name, :cards, :balance

  def initialize(name)
    @name = name
    @cards = []
    @balance = START_BANK
  end

  def take_cards(cards)
    @cards.concat(cards)
  end


  def show_cards
    @cards.each { |card|  print "#{card.value}#{card.suit}" }
  end

  def show_cards_face
    @cards.each do |card|
      print "#{card.value}#{card.suit}", " "
    end
  end

  def show_cards_back
    @cards.each { |card|  print "*", " " }
  end


  def show_curent_balance
    @balance
  end

  def make_bet
    @balance -= BET_AMOUNT
    BET_AMOUNT
  end

  def clear_cards
    @cards = []
  end

  def card_limit?
    @cards.size == MAX_COUNT_CARDS
  end

  def can_open_cards?(command)
    command == "o"
  end


end