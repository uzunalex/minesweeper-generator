class BoardGeneratorService
  # Creates a new board
  # Return a two-dimensional array of cells
  # Each cell is a hash with the following keys:
  #   :bomb => true/false
  def self.create_board(n, m, k)
    bombs = generate_bombs(n, m, k)

    board = []

    for i in 0..n - 1 do
      row = []

      for j in 0..m - 1 do
        row << { bomb: bombs.include?([i, j]) }
      end

      board << row
    end

    board
  end

  def self.generate_bombs(n, m, k)
    cells = []

    for i in 0..n - 1 do
      for j in 0..m - 1 do
        cells << [i, j]
      end
    end

    cells.sample(k)
  end
end
