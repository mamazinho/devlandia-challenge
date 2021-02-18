# frozen_string_literal: true

# This class represent all input process for you reach the princess
# Positions: 0 is the line and 1 is the column during all program
class Match
  def initialize(my_position, princess_position, size)
    @my_position = my_position
    @princess_position = princess_position
    @size = size
    @moves = []
    @grid = Array.new(size[0]) { Array.new(size[1]) }
    validate_inputs
    draw_initial_grid
    next_move
    calc_score
  end

  def validate_inputs
    row_column = Hash[0 => 'row', 1 => 'column']
    (0...2).each do |index|
      rci = row_column[index]
      (@my_position[index]).negative? ? abort("Your initial #{rci} must be filled") : nil
      @size[index] <= 0 ? abort("The number of #{rci}s in your matrix must be filled") : nil
      @my_position[index] >= @size[index] ? abort("Your initial #{rci} exceeds the number of #{rci}s in matrix") : nil
    end
  end

  def draw_initial_grid
    (0...@size[0]).each do |row|
      put_members_on_grid(row)
    end

    @grid.each do |line|
      puts line.join(', ').gsub(',', '')
    end
  end

  def next_move
    @moves << process_move
    next_move while @princess_position != @my_position
  end

  def calc_score
    puts "\nAll moves #{@moves}"
    puts "Last Move #{@moves.last}"

    places = @size[0] * @size[1]
    qnt_moves = @moves.length
    score = (places - qnt_moves) / 10.0
    puts "My Score: #{score.round(2)} (#{places} places minus #{qnt_moves} moves, all over 10)"
    score
  end

  def process_move
    move = move_direction
    move == 'LEFT' ? @my_position[1] -= 1 : nil
    move == 'RIGHT' ? @my_position[1] += 1 : nil
    move == 'UP' ? @my_position[0] -= 1 : nil
    move == 'DOWN' ? @my_position[0] += 1 : nil
    move
  end

  def move_direction
    if @princess_position[0] == @my_position[0] && @princess_position[1] < @my_position[1]
      'LEFT'
    elsif @princess_position[0] == @my_position[0] && @princess_position[1] > @my_position[1]
      'RIGHT'
    elsif @princess_position[0] < @my_position[0]
      'UP'
    else
      'DOWN'
    end
  end

  def put_members_on_grid(row)
    (0...@size[1]).each do |column|
      the_princess_here?(row, column) ? next : nil
      am_i_here?(row, column) ? next : nil

      @grid[row][column] = '-'
    end
  end

  def the_princess_here?(row, column)
    is_here = row == @princess_position[0] && column == @princess_position[1]
    is_here ? @grid[row][column] = 'p' : nil
  end

  def am_i_here?(row, column)
    is_here = row == @my_position[0] && column == @my_position[1]
    is_here ? @grid[row][column] = 'm' : nil
  end
end

if __FILE__ == $PROGRAM_NAME
  size = Array.new(2)

  puts "Number of rows in your matrix:\n"
  size[0] = gets.chomp.to_i

  puts "\nNumber of columns in your matrix:\n"
  size[1] = gets.chomp.to_i

  puts "\nWhat will be your starting line? (PS: The count starts in 1)\n"
  my_row = gets.chomp.to_i - 1

  puts "\nWhat will be your starting column? (PS: The count starts in 1)\n"
  my_column = gets.chomp.to_i - 1
  puts "\n"

  my_position = [my_row, my_column]
  princess_position = [rand(0...size[0]), rand(0...size[1])]
  Match.new(my_position, princess_position, size)
end
