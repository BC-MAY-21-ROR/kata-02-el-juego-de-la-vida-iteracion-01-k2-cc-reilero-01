class Board
    def initialize (row = 0,column = 0)
        @board = []
        row.times do
            @board.push(Array.new(column, '.'))
        end
    end

    def column
        @board[1].length
    end

    def row
        @board.length
    end

    def board
        @board
    end

    def show_board
        puts "rows: #{row} columns: #{column}"
        @board.each do |row|
            puts row.join(" ")
        end
    end

    def is_alive?(position)
        @board[position.x][position.y] == '*'
    end

    def is_valid_position?(position)
        valid_row = position.x >= 0 && position.x <= row-1 
        valid_column = position.y >= 0 && position.y <= column-1
        valid_row && valid_column  
    end

    def put_alive_cell(rowindex, columnindex)
        @board[rowindex][columnindex] = '*'
    end

    def put_dead_cell(rowindex, columnindex)
        @board[rowindex][columnindex] = '.'
    end

end

class Position
    def initialize(x,y)
       @x=x
       @y=y
    end

    def x
        @x       
    end

    def y
        @y             
    end
end


class GameOfLife

    def initialize(board)
        @board = board
    end

    def setup(cantidad)
    end

    def n_generation(cantidad)
        cantidad.times do
            @board.show_board
            @board = next_generation
        end
        @board.show_board
    end

    def next_generation
        new_board = Board.new(@board.row,@board.column)
        @board.board.each_index do |row_index|
            @board.board[row_index].each_index do |column_index|
                neighbours = alive_neighbours(row_index,column_index)
                if @board.is_alive?(Position.new(row_index,column_index))
                    if neighbours >=2 && neighbours <= 3
                        new_board.put_alive_cell(row_index,column_index)
                    else
                        new_board.put_dead_cell(row_index,column_index)
                    end
                else
                    if neighbours == 3
                        new_board.put_alive_cell(row_index,column_index)
                    else
                        new_board.put_dead_cell(row_index,column_index)
                    end
                end
            end
        end
        new_board
    end

    def alive_neighbours(rowindex,columnindex)                
        positions = [
            Position.new(rowindex,columnindex+1),
            Position.new(rowindex+1,columnindex+1),
            Position.new(rowindex+1,columnindex),
            Position.new(rowindex+1,columnindex-1),
            Position.new(rowindex,columnindex-1),
            Position.new(rowindex-1,columnindex-1),
            Position.new(rowindex-1,columnindex),
            Position.new(rowindex-1,columnindex+1)
        ]

        neighbours_position = positions.select do |position|
            @board.is_valid_position?(position)
        end
        
        alive = neighbours_position.select do |position|
            @board.is_alive?(position)
        end

        alive.length
    end
end








board_instance = Board.new(4, 8)
board_instance.put_alive_cell(1,4)
board_instance.put_alive_cell(2,3)
board_instance.put_alive_cell(2,4)
board_instance.put_alive_cell(2,5)
board_instance.put_alive_cell(3,5)

game_instance = GameOfLife.new(board_instance)
new_board = game_instance.n_generation(3)
