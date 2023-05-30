class MarketsController < ApplicationController

  def index
    @facade = MarketFacade.new
  end
end