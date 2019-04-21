class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(input)
    input.split.each do |word|
      @list.append(word)
    end
  end

  def play
    `say -r 500 -v Boing #{list.to_string}`
  end

end
