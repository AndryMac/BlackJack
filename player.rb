class Player < User
  def during_player_turn(command, hand)
    if can_pass?(command)
      puts "Ход переходит к диллеру"
    elsif can_take_card?(command)
      take_cards(hand.del_one_card)
      print "#{@name}: "
      show_cards_face
      puts
    elsif can_open_cards?(command)
    end

  end

  def can_pass?(command)
    command == "p"
  end

  def can_take_card?(command)
    command == "c"
  end

end