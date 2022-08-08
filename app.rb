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
end

instance = Grid.new(4, 5)
puts instance.column
puts instance.row

puts instance.board.join


