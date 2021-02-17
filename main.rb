class Main

  def initialize()
    # Positions: 0 is the line and 1 is the column during all program
    @my_position = Array.new(2)
    @princess_position = Array.new(2)
    @size = Array.new(2)
    @moves = []
    get_inputs()
    draw_initial_grid()
    nextMove()
    calc_result()
  end

  def get_inputs()

    puts "Number of rows in your matrix:\n"
    @size[0] = gets.chomp.to_i
  
    puts "\nNumber of columns in your matrix:\n"
    @size[1] = gets.chomp.to_i
  
    puts "\nWhat will be your starting line? (PS: The count starts in 1)\n"
    my_row = gets.chomp.to_i - 1
  
    puts "\nWhat will be your starting column? (PS: The count starts in 1)\n"
    my_column = gets.chomp.to_i - 1
    puts "\n"
  
    @my_position = [my_row, my_column]
    
    validate_inputs()
  
    @princess_position = [rand(0...@size[0]), rand(0...@size[1])]
    
  end

  def draw_initial_grid()
    grid = Array.new

    (0...@size[0]).each do |row|
      grid[row] = Array.new

      (0...@size[1]).each do |column|
        if row == @princess_position[0] && column == @princess_position[1]
          grid[row][column] = "p"
          next
        end
        if row == @my_position[0] && column == @my_position[1]
          grid[row][column] = "m"
          next
        end
        grid[row][column] = "-"
      end

    end

    grid.each do |line|
      puts line.join(", ").gsub(",", "")
    end

  end

  def process_move()

    new_position = @my_position
    if @princess_position[0] == @my_position[0] && @princess_position[1] < @my_position[1]
      move = "LEFT"
      new_position[1] = @my_position[1] - 1 
    elsif @princess_position[0] == @my_position[0] && @princess_position[1] > @my_position[1]
      move = "RIGHT"
      new_position[1] = @my_position[1] + 1 
    elsif @princess_position[0] < @my_position[0]
      move = "UP"
      new_position[0] = @my_position[0] - 1 
    else
      move = "DOWN"
      new_position[0] = @my_position[0] + 1 
    end
    
    return move, new_position
  end
    
  def nextMove()
    move = ''
    
    to_move, @my_position = process_move()
    @moves << to_move

    while @princess_position != @my_position
      nextMove()
    end

  end
  
  def calc_result()
    puts "\nAll moves #{@moves}"
  
    begin
      puts "Last Move #{@moves.last}"
    rescue
      puts "Has no moves"
    end
  
    places = @size[0] * @size[1]
    qnt_moves = @moves.length()
    score = (places - qnt_moves) / 10.0
    puts "My Score: #{score.round(2)} (#{places} places minus #{qnt_moves} moves, all over 10)"
  end

  def validate_inputs()
    if @my_position[0] < 0
      abort("Your initial row must be filled")
    elsif @my_position[1] < 0
      abort("Your initial column must be filled")
    elsif @size[0] <= 0
      abort("The number of rows in your matrix must be filled")
    elsif @size[1] <= 0
      abort("The number of columns in your matrix must be filled")
    elsif @my_position[0] >= @size[0]
      abort("Your initial row exceeds the number of rows in matrix")
    elsif @my_position[1] >= @size[1]
      abort("Your initial column exceeds the number of columns in matrix")
    else
      nil
    end
  
  end
  
end

if __FILE__ == $0
  Main.new
end