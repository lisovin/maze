class Maze::Solver::DepthFirstMazeSolver < Maze::Solver::AbstractMazeSolver
  
  def solve(maze)
    @maze = maze
    @path = []
    visit_cell(@maze.begin_x, @maze.begin_y)
    @path
  end
  
  def visit_cell(sx, sy)
    return if @maze.solved?
    @path << [sx, sy]
    @maze.directions(sx, sy).each do |direction|
      if sy.between?(0, @maze.height-1) && sx.between?(0, @maze.width-1)
        @maze.mark_as_visited(sx, sy)
        nx = sx + Maze::Builder::BacktrackingMazeFactory::DX[direction]
        ny = sy + Maze::Builder::BacktrackingMazeFactory::DY[direction]
        visit_cell(nx, ny) if !@maze.is_visited?(nx,ny)
      end
    end
    @path.pop unless @maze.solved?
  end
  
end