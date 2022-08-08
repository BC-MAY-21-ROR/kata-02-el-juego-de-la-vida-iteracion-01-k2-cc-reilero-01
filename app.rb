class Grid
    def initialize (column = 0, row = 0)
        @column = column
        @row = row

        @board = []
        row.times do
            @board.push(Array.new(column, '.'))
        end
    end

    def column
        @column
    end

    def row
        @row
    end

    def board
        @board
    end

    def show_board
        @board.each do |row|
            puts row.join(" ")
        end
    end

    def put_alive_cell(rowindex, columnindex)
        @board[rowindex][columnindex] = '*'
    end

    def put_dead_cell(rowindex, columnindex)
        @board[rowindex][columnindex] = '.'
    end

end

class GameOfLife
    def initialize
    end
end

instance = Grid.new(8, 4)
puts instance.column
puts instance.row


instance.put_alive_cell(1, 4)
instance.put_alive_cell(2, 3)
instance.put_alive_cell(2, 4)
instance.show_board