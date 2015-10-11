class Maze::Builder::SimpleMazeFactory < Maze::Builder::AbstractMazeFactory
  
  def initialize(grid)
    @grid = grid
    @begin_x, @begin_y = 0, 0
    @end_x, @end_y = grid[0].size-1, grid.size-1
  end
  
  def build_maze
    Maze::GridMaze.new @grid, [@begin_x, @begin_y], [@end_x, @end_y]
  end
end