class QuestradeSymbolsApi < QuestradeApi
  include HTTParty

  def search_symbol(search_value:)
    response = fetch(end_point: @@END_POINTS[:symbols], query_params: {prefix: search_value})

    if response.success?
      data = response.parsed_response
      puts data['symbols']
      data['symbols']
    else
      puts "####### FAILED #######"
      puts response
    end
  end

  def fetch_symbols_data(symbol_ids:)
    response = fetch(end_point: @@END_POINTS[:symbols_data], query_params: {ids: symbol_ids})

    if response.success?
      data = response.parsed_response
      puts data
      data['symbols']
    else
      puts "####### FAILED #######"
      puts response
    end
  end
end