class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def self.random_word
    DICTIONARY.sample
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(letter)
    arr = []
    @secret_word.chars.each_with_index do |char,idx|
      if char == letter
        arr << idx
      end
    end
    return arr
  end

  def fill_indices(char,idxs)
    idxs.each { |idx| @guess_word[idx] = char }
  end

  def try_guess(guess_char)
    if already_attempted?(guess_char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << guess_char

    if get_matching_indices(guess_char).empty?
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(guess_char, get_matching_indices(guess_char))
    end

    return true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses > 0
      return false
    else
      puts "LOSE"
      return true
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end #class end
