class MazeBuilder
  attr_accessor :maze
  def initialize(width, height)
    @maze = GridMaze.new width, height
  end
end