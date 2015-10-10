class Maze::Builder::BacktrackingMazeFactory < Maze::Builder::AbstractMazeFactory
  def build_maze(width, height, grid = nil)
    return Maze::GridMaze.new width, height
  end
end