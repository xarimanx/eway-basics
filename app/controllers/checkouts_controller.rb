class CheckoutsController < ApplicationController
  def new
    redirect_to result['SharedPaymentUrl']
  end

  def edit
  end

  private

  helper_method :result
  def result
    attrs = {
      Payment: {
        TotalAmount: order.price_in_cents
      },
      RedirectUrl: order_finalize_url(order),
      CancelUrl: 'http://localhost:3000',
      Method: 'ProcessPayment',
      TransactionType: 'Purchase'
    }
    result = nil
    Curl::Easy.http_post("#{EWAY_SERVICE_URL}/AccessCodesShared", attrs.to_json) do |curl|
      curl.headers['Accept'] = 'application/json'
      curl.headers['Content-Type'] = 'application/json'
      curl.http_auth_types = :basic
      curl.username = EWAY_API_KEY
      curl.password = EWAY_API_PASS
      curl.verbose = true
      curl.on_complete {|response, err|
        result = response.body_str
      }
    end
    p JSON.parse(result)
    JSON.parse(result)
  end

  helper_method :order
  def order
    @order ||= Order.find(params[:order_id])
  end
end
