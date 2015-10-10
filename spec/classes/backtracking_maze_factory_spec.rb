require 'spec_helper'


describe 'BacktrackingMazeFactory' do
  let(:maze_builder) { Maze::Builder::BacktrackingMazeFactory.new }  
  let(:simple_maze_builder) { Maze::Builder::SimpleMazeFactory.new }  
  
  context "A simple maze" do
    it 'should correctly create a maze grid' do
      maze = maze_builder.build_maze 1, 1
      expect(maze.grid).to eq([[0]])
    end
    
    it 'should correctly create a maze grid sizes' do
      maze = maze_builder.build_maze 5, 4
      expect(maze.grid.size).to eq(4)
      expect(maze.grid[0].size).to eq(5)
    end
  end
end