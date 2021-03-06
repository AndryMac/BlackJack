class User

  START_BANK = 100
  MAX_COUNT_CARDS = 3
  BET_AMOUNT = 10

  attr_reader :name, :cards, :balance, :opened_cards

  def initialize(name)
    @name = name
    @cards = []
    @balance = START_BANK
    @opened_cards = false
  end

  def positive_balance
    @balance == 0
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

  def open_cards
    @opened_cards = true
  end


  def show_curent_balance
    @balance
  end

  def make_bet
    @balance -= BET_AMOUNT
    BET_AMOUNT
  end

  def take_money(bank)
    @balance += bank
  end

  def clear_cards
    @cards = []
  end

  def card_limit?
    @cards.size == MAX_COUNT_CARDS
  end


  def can_pass?(command)
    command == "p"
  end

  def can_take_card?(command)
    command == "c"
  end

end