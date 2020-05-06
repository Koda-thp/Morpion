# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :players, :game_status, :current_player, :board

  def initialize
    # crée 2 joueurs, crée un board, met le statut à "on going", défini un current_player
    p1 = Player.new("", "X")
    p2 = Player.new("", "O")
    @players = [p1, p2]
    @board = Board.new
    @game_status = "on going"
    @current_player = @players[0]
  end

  def init
    # initialise une partie
    puts "
    -------------------------------------------------
    |                 WELCOME FRIEND                |
    |    C'est parti pour un bon vieux morpion !    |
    |         (trouve un ami pour jouer...)         |
    -------------------------------------------------"
  end

  def ask_players_names
    puts "Quel est le pseudo du player 1 ?"
    puts "Tu joueras avec les 'X'."
    print "> "
    @players[0].name = gets.chomp
    # on renomme le joueur 1 avec l'input
    puts ""
    puts "Quel est le pseudo du player 2 ?"
    puts "Tu joueras avec les 'O'."
    print "> "
    @players[1].name = gets.chomp
    # idem pour le joueur 2
  end

  def turn
    puts ""
    puts "
    -------------------------------------------------

       C'est au tour de #{@current_player.name}, où veux-tu jouer ?

    -------------------------------------------------"
    # demande au current_player où il veut se placer
    puts ""
    print "> "
    choice = gets.chomp

    combination = { "A1" => "0", "A2" => "1", "A3" => "2", "B1" => "3", "B2" => "4", "B3" => "5", "C1" => "6", "C2" => "7", "C3" => "8" }
    # on relie le choix du joueur à l'index de nos cases
    board_case_index = combination[choice].to_i
    # on trouve l'index de la BoardCase en fonction de l'input du player
    selected_case = @board.board_cases_array[board_case_index]
    # on sélectionne la BoardCase en question

    while combination[choice].nil? || selected_case.sign != " "
      if choice == "q"
        # on check si le joueur veut sortir du jeu sans faire ctrl + C
        puts "Bye friend"
        abort
      end
      if combination[choice].nil?
        # on check si la case ou le joueur existe
        puts "L'ordinateur ne comprend pas où tu veux te placer."
        puts "Pense bien à indiquer ton choix du type 'A1', 'B3', etc."
      end
      if selected_case.sign != " "
        # on check si la case en question est vide (personne ne s'est déjà placé)
        puts "Bien essayé petit malin, mais cette case est prise. Try again."
      end

      print "> "
      choice = gets.chomp

      board_case_index = combination[choice].to_i
      selected_case = @board.board_cases_array[board_case_index]
      # on remet les variables ici pour modifier leurs valeurs avec le nouvel input
      # sinon l'erreur se remet en boucle
    end

    selected_case.sign = @current_player.sign
    # la case sélectionnée prend le signe du joueur
    @board.count_turn += 1
    # on incrémente notre compteur
    puts "C'est joué, bravo."

    if @current_player == @players[0]
      # on change le current player à chaque tour
      @current_player = @players[1]
      return true
    else
      @current_player = @players[0]
    end
  end

  def new_round
    # relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    @board.board_cases_array.each do |board_case|
      board_case.sign = " "
    end
    @board.count_turn = 0
  end

  def game_end
    # affichage de fin de partie quand un vainqueur est détecté ou s'il y a match nul
    if @board.victory?
      # on check s'il y a un gagnant
      puts ""
      puts "  C'EST ENORME ! TU ES INCROYABLE."
      if @current_player == @players[0]
        # on check qui est le gagnant
        puts "  Toutes nos félicitations #{@players[1].name.upcase}"
        puts ""
        puts "  #{@players[0].name} ne te laisse pas faire, relance une partie !"
        @players[1].victory_number += 1
      else
        puts "  Toutes nos félicitations #{@players[0].name}"
        puts ""
        puts "  #{@players[1].name} ne te laisse pas faire, relance une partie !"
        @players[0].victory_number += 1
      end
    else
      # sinon c'est match nul
      puts "  Personne ne gagne, quelle tristesse..."
      puts "  On ne peut pas rester, comme ça. ON Y RETOURNE !"
    end
    # affichage des scores
    puts "=" * 50
    puts ""
    print " " * 20
    puts "#{@players[0].name.upcase}   #{@players[0].victory_number}"
    puts ""
    puts "-" * 50
    puts ""
    print " " * 20
    puts "#{@players[1].name.upcase}   #{@players[1].victory_number}"
    puts ""
    puts "=" * 50
  end
end
