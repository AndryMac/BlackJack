class Diller < User
  def initialize(name = "Diller")
    super(name)
  end

  def during_diller_turn(command, hand)
    if can_take_card?(command)
      take_cards(hand.del_one_card)
    else
      puts "Диллер делает пас"
      puts
    end
  end


end