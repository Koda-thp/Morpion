# frozen_string_literal: true

class Player
  attr_reader :sign
  attr_accessor :victory_number, :name

  def initialize(name, sign)
    # nom, valeur et nombre de victoires
    @name = name
    @sign = sign
    @victory_number = 0
  end
end
