# frozen_string_literal: true

require_relative "board_case"
require_relative "game"
require_relative "player"

class Board < Game
  # array qui contient les BoardCases et @count_turn pour compter le nombre de coups joués
  attr_accessor :board_cases_array, :count_turn

  def initialize
    @board_cases_array = []
    # crée 9 instances BoardCases qu'on range dans une array
    (1..9).each do |i|
      @board_cases_array << BoardCase.new(i.to_s)
    end
    @count_turn = 0
  end

  def victory?
    # méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    win = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    # array de toutes les combinaisons gagnantes avec l'id de chaque BoardCase

    win.each do |combination|
      if @board_cases_array[combination[0]].sign != " " && @board_cases_array[combination[0]].sign == @board_cases_array[combination[1]].sign && @board_cases_array[combination[1]].sign == @board_cases_array[combination[2]].sign
        # condition : les 3 BoardCase égalent et contiennent autre chose qu'un string vide
        return true
        # pour dire qu'on a un gagnant si la condition est validée
      end
    end

    return false if @count_turn == 9
    # s'il y a 9 tours et pas de gagnant, on retourne false (pour dire que c'est égalité)
  end
end
