class FinalizesController < ApplicationController
  def show
    @result = nil
    Curl::Easy.http_get("#{EWAY_SERVICE_URL}/AccessCode/#{params[:AccessCode]}") do |curl|
      curl.headers["Accept"] = "application/json"
      curl.headers["Content-Type"] = "application/json"
      curl.http_auth_types = :basic
      curl.username = EWAY_API_KEY
      curl.password = EWAY_API_PASS
      curl.verbose = true
      curl.on_complete {|response, err|
        @result = response.body_str
      }
    end
  end

  helper_method :order
  def order
    @order ||= Order.find(params[:order_id])
  end
end
