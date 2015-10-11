class Maze::Builder::AbstractMazeFactory
  def build_maze
    raize NotImplementedError, "#{self.class.name} does not implement build_maze()"
  end
end