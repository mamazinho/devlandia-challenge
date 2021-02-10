def get_princess_position(size, grid)
    princess_position = []
    (0...size).each do |row|
        (0...size).each do |column|
            if grid[row][column] == 'p'
                princess_position.push(row)
                princess_position.push(column)
            end
        end
    end
    princess_position
end

def process_move(princess_position, my_position)

    # my_position and princess: 0 is the line and 1 is the column
    new_position = my_position
    if princess_position[0] == my_position[0] and princess_position[1] < my_position[1]
        move = 'LEFT'
        new_position[1] = my_position[1] - 1 
    elsif princess_position[0] == my_position[0] and princess_position[1] > my_position[1]
        move = 'RIGHT'
        new_position[1] = my_position[1] + 1 
    elsif princess_position[0] < my_position[0]
        move = 'UP'
        new_position[0] = my_position[0] - 1 
    else
        move = 'DOWN'
        new_position[0] = my_position[0] + 1 
    end
    
    return move, new_position
end
    
def nextMove(princess_position, my_position, moves=[])
    move = ''
    
    to_move, my_position = process_move(princess_position, my_position)
    moves << to_move
    while princess_position != my_position do
        nextMove(princess_position, my_position, moves)
    end

    return moves
end

# NxN, the size is the N (always is a square)
puts "Qual o numero de colunas e linhas? \n"
size = gets.chomp.to_i
puts "\nEm qual linha você está?\n"
my_line = gets.chomp.to_i
puts "\nEm qual coluna você está?\n"
my_column = gets.chomp.to_i
my_position = [my_line, my_column]

grid = Array.new(size)

(0...size).each do |i|
    # This input shold be '-----' or '--m-p-'
    grid[i] = gets
end

princess_position = get_princess_position(size, grid)
moves = nextMove(princess_position, my_position)

puts "All moves #{moves}"

begin
    puts "Last Move#{moves.last}"
rescue
    puts "Has no moves"
end