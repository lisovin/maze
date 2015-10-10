# Maze Builder and Solver

Build and solve maze

[![Build Status](https://travis-ci.org/fokcep/maze.svg)](https://travis-ci.org/fokcep/maze) [![Coverage Status](https://img.shields.io/coveralls/fokcep/maze.svg)](https://coveralls.io/r/fokcep/maze?branch=master) [![Code Climate](https://codeclimate.com/repos/5618e532e30ba0235a019e07/badges/fccc1f63d0f461ec2cb0/gpa.svg)](https://codeclimate.com/repos/5618e532e30ba0235a019e07/feed)

## Instructions 

```ruby
	m = Maze.new 5, 5
	m.print
	m.solve
```
#Implementation

Used backtracking algorithm to build and depth first search to find path

#Assumptions 

Entry point 'A' and exit point 'B' are always top left and bottom right.
