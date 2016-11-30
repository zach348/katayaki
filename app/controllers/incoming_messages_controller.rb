class IncomingMessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    recipient = params[:envelope][:to]
    subject = params[:subject]
    plain = params[:plain]
    html = params[:html]

    # Rails.logger.log params[:attachments][0] if params[:attachments] # A tempfile attachment if attachments is populated

    msg = Email.new(recipient: recipient, subject: subject, plain: plain, html: html )
    msg.save
    # Do some other stuff with the mail message

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end

  protected

  def email_params
    params.require(:envelope, :subject, :plain, :html)
  end
end
