class QuestradeAccountsApi < QuestradeApi
  include HTTParty

  def get_accounts
    response = fetch(end_point: @@END_POINTS[:accounts])

    if response.success?
      data = response.parsed_response
      data["accounts"]
    else
      puts "####### FAILED #######"
      puts response
    end
  end
end