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

end