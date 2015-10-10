class Maze::Builder::AbstractMazeFactory
  def build_maze(width, height, grid = nil)
    raize NotImplementedError, "#{self.class.name} does not implement build_maze()"
  end
end