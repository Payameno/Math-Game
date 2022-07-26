class Run
  attr_accessor :player1, :player2, :current_player

  def initialize
    @player1 = ""
    @player2 = ""
    @current_player = ""
  end

  def initiate
    puts "Welcome to the game of addition"
    puts ""
    puts "What's your name?"
    name = $stdin.gets.chomp()
    @player1 = Player.new(name)

    puts "#{@player1.name} is the first player with #{@player1.life} lives"
    puts ""
    puts "PLayer 2, What's your name?"
    name = $stdin.gets.chomp()
    @player2 = Player.new(name)

    puts "#{@player2.name} is the second player with #{@player2.life} lives"
    puts ""
    @current_player = @player1
  end

  def inquiries

    round = 1

    while @player1.life != 0 || @player2.life != 0
    inquiry = Question.new
      puts "Round #{round}"
      puts "#{@current_player.name} #{inquiry.question}"
      answer = $stdin.gets.chomp()
        if inquiry.check_answer(answer)
          puts "That's correct #{@current_player.name}! Life: #{@current_player.life}/3"
        else
          @current_player.decrease
          puts "That's incorrect! Life: #{@current_player.life}/3"
        end
        puts "#{@player1.name}: #{@player1.life}/3 Vs #{@player2.name}: #{@player2.life}/3"
        round += 1
        if @current_player.life == 0
          puts "#{@current_player.name}, You lose!"
          puts "GAME OVER"
          break
        end
        if @current_player == @player1
          @current_player = @player2
        else
          @current_player = @player1
        end
    end    
  end
end