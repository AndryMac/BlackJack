class Hand

  TEN_VALUE = 10
  ACE_MIN_VALUE = 1
  ACE_MAX_VALUE = 11
  WIN_SCORE = 21

  attr_reader :cards

  def initialize
    deck = Deck.new
    @cards = deck.cards
  end


  def deal_cards(count = 2)
    @cards.sample(count).each { |value| @cards.delete(value)}
  end

  def del_one_card
    deal_cards(1)
  end



  def get_card_value(card)
    if %w(J Q K).include? card.value
      TEN_VALUE
    elsif card.value == "A"
      ACE_MIN_VALUE
    else
      card.value.to_i
    end
  end

  def score(cards)
    total_score = 0
    ace_count = 0
    cards.each do |card|
      ace_count += ACE_MIN_VALUE if card.value == "A"
      total_score += get_card_value(card)
    end
    if ace_count > 0
      add_calculation_ace(ace_count, total_score)
    else
      total_score
    end
  end

  def add_calculation_ace(ace_count, total_score)
    if ace_count == 3
      total_score = 13
      total_score
    elsif ace_count == 2
      total_score += 10 if (total_score - 2) < 10
      total_score
    elsif ace_count == 1
      total_score += 10 if (total_score - 1) < 11
      total_score
    else
      total_score
    end
  end


  def win_score?(score)
    WIN_SCORE == score
  end

  def score_bust(score)
    WIN_SCORE < score
  end

  def player_win?(player_score, diller_score)
    win_score?(player_score) || player_score > diller_score
  end
end

