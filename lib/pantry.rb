require 'pry'
require './lib/ingredient'
require './lib/recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock
    @stock
  end

  def stock_check(ingredient)
    if @stock.keys.include?(ingredient)
      @stock[ingredient]
    else
      @stock[ingredient] = 0
    end
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    if @stock.keys.include?(ingredient)
       @stock[ingredient] += amount
     else
      @stock[ingredient] = amount
    end
  end

  def enough_ingredients_for?(recipe)
    enough = true
    (recipe.ingredients_required).map do |ingredient, amount|
      # binding.pry
      if @stock[ingredient] == nil || @stock[ingredient] < amount
        enough = false
      elsif @stock[ingredient] >= amount
        enough = true
      end
    end
    enough
  end
end
