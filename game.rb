class Game

  def initialize
    @player = Player.new("Andy")
    @diller = Diller.new
    @bank = 0
  end

  def start_game
    @hand = Hand.new
    deal_cards
    bet_to_bank
    play_game
  end

  def play_game
    show_info
    player_move

  end

  def show_info
    print "#{@player.name}: "
    show_cards_face
    puts "Сумма очков - #{show_score_cards}"
    print "#{@diller.name}: "
    show_cards_back
    puts
  end



  def player_move
    command = "c"
    @player.during_player_turn(command, @hand)

  end

  def diller_move
    sleep(3)
    puts "Надо подумать"
    puts "Мой ход"
  end



  def deal_cards
    @player.take_cards(@hand.deal_cards)
    @diller.take_cards(@hand.deal_cards)
  end

  def bet_to_bank
    @bank += @player.make_bet
    @bank += @diller.make_bet
  end

  def show_score_cards
    @hand.score(@player.cards)
  end

  def show_curent_balance
    @player.show_curent_balance
  end


  def show_cards_play
    @player.show_cards
  end

  def show_cards_dil
    @diller.show_cards
  end

  def show_cards_face
    @player.show_cards_face
  end

  def show_cards_back
    @diller.show_cards_back
  end

end