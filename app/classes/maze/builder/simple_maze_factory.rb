class Maze::Builder::SimpleMazeFactory < Maze::Builder::AbstractMazeFactory
  def build_maze(width, height, grid)
    return Maze::GridMaze.new grid, [0,0], [grid.length, grid[0].length]
  end
end