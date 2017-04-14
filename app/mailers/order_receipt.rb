class OrderReceipt < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(order, user)
    email = user.email
    @order = order
    @user = user
    @greeting = "Order received!"
    mg_client = Mailgun::Client.new Rails.application.secrets.mailgun_api_key
    message_params = {:from    => "no-reply@jungle.com",
                      :to      => email,
                      :subject => 'Sample Mail using Mailgun API',
                      :html => (render_to_string(template: "../views/order_receipt/order_receipt")).to_str}
    mg_client.send_message Rails.application.secrets.mailgun_domain, message_params
  end

end
