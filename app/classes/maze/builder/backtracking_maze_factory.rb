class Maze::Builder::BacktrackingMazeFactory < Maze::Builder::AbstractMazeFactory
  
  N, S, E, W = 1, 2, 4, 8 # cell move directions
  DX  = { E => 1, W => -1, N =>  0, S => 0 } # shift by x axis in given direction
  DY  = { E => 0, W =>  0, N => -1, S => 1 } # shift by y axis in given direction
  OPPOSITE  = { E => W, W =>  E, N =>  S, S => N }
  
  def build_maze(width, height, grid = nil)
    if grid.nil?
      @grid = Array.new(height) { Array.new(width, 0) }
      step_from(0, 0, @grid)
    else
      @grid = grid
    end
    return Maze::GridMaze.new @grid, [0,0], [@grid.length, @grid[0].length]
  end
  
  private

  def step_from(cx, cy, grid)
    directions = [N, S, E, W].shuffle
    directions.each do |direction|
      nx, ny = cx + DX[direction], cy + DY[direction]
      if ny.between?(0, grid.length-1) && nx.between?(0, grid[ny].length-1) && grid[ny][nx] == 0
        grid[cy][cx] |= direction
        grid[ny][nx] |= OPPOSITE[direction]
        step_from(nx, ny, grid)
      end
    end
  end
  
end