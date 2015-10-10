class Maze::Builder::SimpleMazeFactory < Maze::Builder::AbstractMazeFactory
  def build_maze(width, height, grid)
    return Maze::GridMaze.new 0, 0, grid
  end
end