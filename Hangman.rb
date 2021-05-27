class LetsPlayHangman

  def initialize
    @tries = 11
    @the_word = wordlist.sample    
    @word_reveal = ""

    @the_word.first.size.times do
      @word_reveal += "_ "
    end
  end

  def wordlist
    [
      ["Yclept", "Past participle of clepe"],
      ["Squush", "To crush"],
      ["Kickshaw", "A fancy dish"],
      ["Squdgy", "Squat, pudgy"],
      ["Diphthong", "A gliding monosyllabic speech sound"],
    ]
  end

  def print_reveal last_choice = nil
    update_reveal(last_choice) unless last_choice.nil?
    puts @word_reveal
  end

  def update_reveal last_choice
    new_reveal = @word_reveal.split

    new_reveal.each_with_index do |character, index|
      if character == '_' && @the_word.first[index] == last_choice
        new_reveal[index] = last_choice
      end
    end

    @word_reveal = new_reveal.join(' ')
  end

  def make_choice
    if @tries > 0
      puts "Enter a character"
      choice = gets.chomp

      good_choice = @the_word.first.include? choice

      if choice == "done"
        puts "Game ended! Bye!"
        
      elsif choice.length > 1
        puts "only guess 1 letter at a time please!"
          make_choice
        
      elsif good_choice
        puts "You are correct!"

        print_reveal choice

        if @the_word.first == @word_reveal.split.join
          puts "GREAT JOB! you won this game!"
        else
          make_choice
        end
      else
        @tries -= 1
        puts "No, sorry you have #{ @tries } chances left. Try again!"
        make_choice
      end
    else
      puts "Game over! Good luck next time!"
    end
  end

  def start
    puts "Game started! Your word is #{@the_word.first.size } characters long"
    puts "To end the game, type 'done'"
    print_reveal

    puts "Hint: #{ @the_word.last }"

    make_choice
  end

end

round = LetsPlayHangman.new
round.start