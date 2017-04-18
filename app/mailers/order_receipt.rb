class OrderReceipt < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(order, user)
    email = user.email
    @order = order
    @user = user
    @greeting = "Order received!"
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {:from    => "no-reply@jungle.com",
                      :to      => email,
                      :subject => "Jungle Shopping - Order ##{@order.id}",
                      :html => (render_to_string(template: "../views/order_receipt/order_receipt")).to_str}
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end

end
