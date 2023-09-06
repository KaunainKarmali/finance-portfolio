require 'httparty'

class QuestradeApi
  @@END_POINTS = {
    accounts: 'v1/accounts',
    symbols: 'v1/symbols/search',
    symbols_data: 'v1/symbols',
  }

  def fetch(end_point:, query_params: {})
    url = build_url(end_point: end_point, query_params: query_params)
    HTTParty.get(url, headers: headers)
  end

  private
  
  def access_token
    ENV['ACCESS_TOKEN']
  end

  def base_url
    ENV['API_SERVER']
  end

  def headers
    {
      'Authorization' => "Bearer #{access_token}",
      'Host' => base_url
    }
  end

  def build_url(end_point:, query_params:)
    query_string_params = convert_to_query_string(query_params: query_params)
    "#{base_url}#{end_point}?#{query_string_params}"
  end

  def convert_to_query_string(query_params:)
    query_params.map { |key, value| 
      "#{key}=#{format_query_value(value: value)}"
    }.join('&')
  end

  def format_query_value(value:)
    value.is_a?(Array) ? value.join(',') : value
  end
end