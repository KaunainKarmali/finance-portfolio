class AccountsController < ApplicationController
  def index
    api_service = QuestradeAccountsApi.new
    @accounts = api_service.get_accounts
  end
end