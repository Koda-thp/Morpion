# frozen_string_literal: true

class Show
  def show_board(board)
    # TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    puts "
                 1         2         3
            -------------------------------
            |         |         |         |
         A  |    #{board.board_cases_array[0].sign}    |    #{board.board_cases_array[1].sign}    |    #{board.board_cases_array[2].sign}    |
            |         |         |         |
            -------------------------------
            |         |         |         |
         B  |    #{board.board_cases_array[3].sign}    |    #{board.board_cases_array[4].sign}    |    #{board.board_cases_array[5].sign}    |
            |         |         |         |
            -------------------------------
            |         |         |         |
         C  |    #{board.board_cases_array[6].sign}    |    #{board.board_cases_array[7].sign}    |    #{board.board_cases_array[8].sign}    |
            |         |         |         |
            -------------------------------"
  end
end
