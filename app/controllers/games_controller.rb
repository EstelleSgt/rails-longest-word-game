require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
  word = params[:query]
  letters = params[:letters]
  raise
  url = "https://wagon-dictionary.herokuapp.com/#{@word}"
  user_read = open(url).read
  @user = JSON.parse(user_read)
  end

  private

  def included?(word, letters)
    word.chars.each do |char|
      current_index = letters.index(char)
      if current_index
        letters.delete_at(current_index)
      else
        return false
      end
    end
  end
end
