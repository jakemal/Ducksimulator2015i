require 'gosu'
require_relative 'duck'

class GameWindow < Gosu::Window

	def initialize
		super 640, 480
			self.caption = "Gosu Tutorial Game"

			@background_image = Gosu::Image.new("media/skylandwater.png")
																					 :tileable => true )

			@player = Player.new
			@player.warp(width/3.0, height/2.0)

			@timer = Timer.new(@player)
			@font = Gosu::Font:new(20)
	end

	def update
		return if @timer.game_over?
		#return if @player.death

		@player.go_left if Gosu::button_down? Gosu::KbLeft
		@player.go_right if Gosu::button_down? Gosu::KbRight

		@player.move

	end

	def draw 
		@player.draw
		@background_image.draw(0, 0, ZOrder::BACKGROUND)
		@font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
		@font.draw("#{@timer.print_out}", 500, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
	end

	def button_down(id)
		close if id == Gosu::KbEscape		
	end


end