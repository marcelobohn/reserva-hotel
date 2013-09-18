class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :autenticacao if Rails.env.production?
 
  private
 
  def autenticacao
    authenticate_or_request_with_http_basic do |usuario, senha|
      usuario == 'vilarica' && senha == 'vilarica'
    end
  end  
end
