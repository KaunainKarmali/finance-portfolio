class SymbolsController < ApplicationController
  def index
    api_service = QuestradeSymbolsApi.new
    @symbols = api_service.fetch_symbols_data(symbol_ids: [8049, 39472334])
    # @symbols = api_service.search_symbol(search_value: params[:query])
  end
end