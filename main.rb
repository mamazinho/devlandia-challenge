def draw_initial_grid(princess_position, my_position, size)
    grid = Array.new

    (0...size[0]).each do |row|
        grid[row] = Array.new

        (0...size[1]).each do |column|
            if row == princess_position[0] && column == princess_position[1]
                grid[row][column] = "p"
                next
            end
            if row == my_position[0] && column == my_position[1]
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

def process_move(princess_position, my_position)

    # Positions: 0 is the line and 1 is the column
    new_position = my_position
    if princess_position[0] == my_position[0] and princess_position[1] < my_position[1]
        move = "LEFT"
        new_position[1] = my_position[1] - 1 
    elsif princess_position[0] == my_position[0] and princess_position[1] > my_position[1]
        move = "RIGHT"
        new_position[1] = my_position[1] + 1 
    elsif princess_position[0] < my_position[0]
        move = "UP"
        new_position[0] = my_position[0] - 1 
    else
        move = "DOWN"
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

if __FILE__ == $0
    size = Array.new(2)

    puts "Qual o numero de linhas da matriz? \n"
    size[0] = gets.chomp.to_i

    puts "\nQual o numero de colunas da matriz? \n"
    size[1] = gets.chomp.to_i

    puts "\nEm qual linha você está? (OBS: 0 conta como a primeira linha)\n"
    my_row = gets.chomp.to_i

    puts "\nEm qual coluna você está? (OBS: 0 conta como a primeira coluna)\n"
    my_column = gets.chomp.to_i
    puts "\n"

    my_position = [my_row, my_column]

    if my_position[0] >= size[0] || my_position[1] >= size[1]
        puts "A posição que você se colocou está fora do tamanho máximo da matriz"
        return
    end

    princess_position = [rand(0...size[0]), rand(0...size[1])]

    draw_initial_grid(princess_position, my_position, size)
    moves = nextMove(princess_position, my_position)

    puts "\nAll moves #{moves}"

    begin
        puts "Last Move #{moves.last}"
    rescue
        puts "Has no moves"
    end
end