require "Gosu"
require_relative "z_order"


class Player

  attr_reader :score, :x, :y 
	
	def initialize animation
		@animation = animation
		@score = 0
		@x = 240
		@y = 240
		@anim = 0
		@angle = 90
		@layer = 1
	end

	def draw
		img = @animation[0]
		img.draw(@x, @y, 1)
	end

	def draw_anim
		img = @animation[@anim / 5 % @animation.size]
		img.draw(@x, @y, 1)
	end

	def go_left
		@x -= 5
		@anim += 1

		@x = 490 if @x <= -100
	end

	def go_right
		@x += 5
		@anim += 1
		@x = -90 if @x >= 475
	end

	def warp(x, y)
		@x, @y = x, y
	end

end