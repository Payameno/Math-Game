class Question

  attr_reader :answer, :question

  def initialize
    @first_number = rand(21)
    @second_number = rand(21)
    @answer = @first_number + @second_number
    @question = "What's the sum of #{@first_number} and #{@second_number} ?\n"
  end

  def check_answer(input)
    if input == @answer.to_s
      return true
    else
      return false
    end
  end

end
