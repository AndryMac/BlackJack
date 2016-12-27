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
    determine_winner

  end

  def show_info
    print "#{@player.name}: "
    show_cards_face
    puts "Сумма очков - #{show_score_cards_player}"
    print "#{@diller.name}: "
    show_cards_dil
    puts
  end



  def player_move
    command = "c"
    @player.during_player_turn(command, @hand)
    show_info
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

  def show_score_cards_player
    @hand.score(@player.cards)
  end

  def show_score_cards_diller
    @hand.score(@diller.cards)
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




  def determine_winner
    player_score = show_score_cards_player
    diller_score = show_score_cards_diller
    if player_score == diller_score
      @bank = @bank / 2
      @player.take_money(@bank)
      @diller.take_money(@bank)
      puts "Ничья"
    elsif @hand.player_win?(player_score, diller_score)
      @player.take_money(@bank)
      puts "#{@player.name} - победил"
    else
      @diller.take_money(@bank)
      puts "#{@player.name} - проиграл"
    end

  end

end