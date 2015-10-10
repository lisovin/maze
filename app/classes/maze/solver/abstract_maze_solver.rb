class Maze::Solver::AbstractMazeSolver
  def solve(maze)
    raize NotImplementedError, "#{self.class.name} does not implement solve()"
  end
end