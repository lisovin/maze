class Maze::Builder::BacktrackingMazeFactory < Maze::Builder::AbstractMazeFactory
  
  N, S, E, W = 1, 2, 4, 8
  DX  = { E => 1, W => -1, N =>  0, S => 0 }
  DY  = { E => 0, W =>  0, N => -1, S => 1 }
  OPPOSITE  = { E => W, W =>  E, N =>  S, S => N }
  
  def initialize(width, height)
    @width  = width
    @height = height
    @grid = Array.new(height) { Array.new(width, 0) }
    @begin_x, @begin_y = 0, 0
    @end_x, @end_y = @width-1, @height-1
    step_from(@begin_x, @begin_y)
  end
  
  def build_maze
    Maze::GridMaze.new @grid, [@begin_x,@begin_y], [@end_x, @end_y]
  end
  
  private

  def step_from(cx, cy)
    directions = [N, S, E, W].shuffle
    directions.each do |direction|
      nx, ny = cx + DX[direction], cy + DY[direction]
      if ny.between?(0, @height-1) && nx.between?(0, @width-1) && @grid[ny][nx] == 0
        @grid[cy][cx] |= direction
        @grid[ny][nx] |= OPPOSITE[direction]
        step_from(nx, ny)
      end
    end
  end
  
end