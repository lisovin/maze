require 'spec_helper'

describe 'DepthFirstMazeFactory' do
  let(:maze_solver) { Maze::Solver::DepthFirstMazeSolver.new }  
  let(:maze) { (Maze::Builder::SimpleMazeFactory.new).build_maze(nil, nil, [[4, 12, 10], [6, 12, 9], [5, 12, 8]]) }  
  let(:random_maze) { (Maze::Builder::BacktrackingMazeFactory.new).build_maze(5, 5) }  
  
  context "A new maze" do
    it 'should solve maze correctly' do
      expect(maze_solver.solve(maze)).to eq([[0, 0], [1, 0], [2, 0], [2, 1], [1, 1], [0, 1], [0, 2], [1, 2], [2, 2]] )
    end
    
    
  end
end