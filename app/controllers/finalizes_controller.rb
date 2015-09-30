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
{
  "AccessCode":"60CF3fZryW_vHZ1orbE7mhppeLg6CroLWn7WS4sRnnr39fz6PDcO3lnKAXJYv0bC9EKYmI8kWs_29eC8hJ7EsMJtnRCJLjETyAizEr_F7XeguWE1U1N1FvPKOrNJQYi_cFcUE-BddNHE6djze_LeeinvHcA==",
  "AuthorisationCode":"936260",
  "ResponseCode":"00",
  "ResponseMessage":"A2000",
  "InvoiceNumber":"",
  "InvoiceReference":"",
  "TotalAmount":1000,
  "TransactionID":11954681,
  "TransactionStatus":true,
  "TokenCustomerID":null,
  "BeagleScore":0,
  "Options":[

  ],
  "Verification":{
    "CVN":0,
    "Address":0,
    "Email":0,
    "Mobile":0,
    "Phone":0
  },
  "BeagleVerification":{
    "Email":0,
    "Phone":0
  },
  "Errors":null
}
