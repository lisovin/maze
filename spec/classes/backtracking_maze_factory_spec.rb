require 'spec_helper'

describe 'BacktrackingMazeFactory' do
  let(:maze_builder) { Maze::Builder::BacktrackingMazeFactory.new 1,1 }  
  let(:simple_maze_builder) { Maze::Builder::SimpleMazeFactory.new [[2, 4, 10], [5, 12, 11], [4, 12, 9]]}  
  
  context "A simple maze" do
    it 'should correctly create a maze grid' do
      maze = maze_builder.build_maze
      expect(maze.directions(0,0).length).to eq(0)
    end
    
    it 'should not have any blocked cells' do
      maze = simple_maze_builder.build_maze
      expect(maze.directions(0,0).length).to eq(1)
    end
    
  end
end