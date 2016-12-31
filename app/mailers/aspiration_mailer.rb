class AspirationMailer < ApplicationMailer
  def new_impact(vote)
    @vote = vote

    mail(
      to: @vote.aspiration.user.email,
      subject: "It grows!"
    )
  end
end
