require 'gosu'
require_relative 'z_order'
require_relative 'player'
require_relative 'bread'

class Main < Gosu::Window

	def initialize
			super 640, 400
			self.caption = "Duck Sim 2015i"

			@background = Gosu::Image.new("media/skylandwater.png")

			@player_anim = Gosu::Image::load_tiles("media/duck.png", 255, 154)
			@player = Player.new(@player_anim)

			 # @timer = Timer.new(@player)
			 # @font = Gosu::Font:new(20)
	end

	def update
	  # return if @timer.game_over?

		@player.go_left if Gosu::button_down? Gosu::KbLeft
		@player.go_right if Gosu::button_down? Gosu::KbRight

		

	end

	def draw 
		@background.draw(0,0,0)
		@player.draw_anim
		# @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
		# @font.draw("#{@timer.print_out}", 500, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
	end

	def button_down(id)
		close if id == Gosu::KbEscape		
	end

end

window = Main.new
window.show