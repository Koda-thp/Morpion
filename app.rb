# frozen_string_literal: true

require 'bundler'
Bundler.require

$:.unshift File.expand_path('lib', __dir__)
require 'app/board'
require 'app/board_case'
require 'app/game'
require 'app/player'
require 'views/application'
require 'views/show'

Application.new.perform

# binding.pry
