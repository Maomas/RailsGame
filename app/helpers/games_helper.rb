module GamesHelper
	def game_params
		params.require(:game).permit(:title, :description, :image)
	end
end
