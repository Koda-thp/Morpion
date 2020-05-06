# frozen_string_literal: true

class Application
  def perform
    game = Game.new
    show = Show.new
    # on initialise game et show

    game.init
    game.ask_players_names
    sleep 1
    loop do
      while game.board.victory?.nil?
        system "clear"
        show.show_board(game.board)
        game.turn
        game.board.victory?
      end
      game.game_end
      sleep 5
      game.new_round
    end
  end
end
