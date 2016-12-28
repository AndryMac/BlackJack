class Game

  attr_accessor :game_over

  def initialize
    puts "Укажите свое имя"
    @name = gets.chomp
    @player = Player.new(@name)
    @diller = Diller.new
    @bank = 0
    @game_over = false
  end

  def start_game
    @hand = Hand.new
    deal_cards
    bet_to_bank
    play_game
    open_cards
    show_full_info
    more
  end

  protected

  def more
    puts "Играем еще? Y/N?"
    answer = gets.chomp.downcase
    if answer == "y"
      @player.clear_cards
      @diller.clear_cards
      @game_over = false
      puts "Ваш баланс: #{@player.show_curent_balance}"
      puts "Баланс диллера: #{@diller.show_curent_balance}"
      puts
      @bank = 0
      positive_balance
    elsif answer == "n"
      exit_game
    else
      puts "Вы ввели не верную команду"
    end
  end

  def exit_game
    exit
  end

  def positive_balance
    if @diller.positive_balance
      puts "У диллера на счету 0"
      puts "Игра закончена, вы победили"
    elsif @player.positive_balance
      puts "У вас 0 на счету"
      puts "Игра закончена, вы проигрли"
    else
      start_game
    end
  end

  def play_game
    until @game_over
      show_info
      puts
      player_move
      diller_move
    end
  end

  def open_cards
    determine_winner
  end

  def show_info
    print "#{@player.name}: "
    show_cards_face
    puts "Сумма очков - #{show_score_cards_player}"
    print "#{@diller.name}: "
    show_cards_back
    puts
  end

  def show_full_info
    print "#{@player.name}: "
    show_cards_face
    puts "Сумма очков - #{show_score_cards_player}"
    print "#{@diller.name}: "
    show_cards_dil
    puts "Сумма очков - #{show_score_cards_diller}"
    puts
  end

  def player_move
    unless @player.card_limit?
      puts "Укажите действие"
      puts "p - пропустить ход"
      puts "с - взять карту"
      puts "o - открыть карты"
      command = gets.chomp
      @player.during_player_turn(command, @hand)
      self.game_over = @player.opened_cards || @player.card_limit?
    end
  end


  def diller_move
    unless @diller.card_limit?
      if show_score_cards_diller < 18
        command = "c"
      else
        command = "p"
      end
      @diller.during_diller_turn(command, @hand)
      stop_game
    end
  end

  def stop_game
    if @player.card_limit? && @diller.card_limit?
      self.game_over = true
      puts "Определяем победителя"
      sleep(2)
    end
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

  def show_curent_balance_player
    @player.show_curent_balance
  end

  def show_curent_balance_diller
    @diller.show_curent_balance
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
    if (player_score == diller_score) || (@hand.player_lose?(player_score) && @hand.diller_lose?(diller_score))
      @bank = @bank / 2
      @player.take_money(@bank)
      @diller.take_money(@bank)
      puts "Ничья"
    elsif @hand.player_win_21?(player_score) || @hand.diller_lose?(diller_score) || @hand.player_win_score(player_score, diller_score)
      @player.take_money(@bank)
      puts "#{@player.name} - победил"
    elsif @hand.diller_win_21?(diller_score)  ||  @hand.player_lose?(player_score) ||  @hand.diller_win_score(player_score, diller_score)
      @diller.take_money(@bank)
      puts "#{@player.name} - проиграл"
    end

  end

end