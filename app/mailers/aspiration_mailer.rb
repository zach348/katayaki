class AspirationMailer < ApplicationMailer
  def new_impact(vote)
    @vote = vote
    binding.pry

    mail(
      to: vote.aspiration.user.email,
      subject: "Growth!"
    )
  end
end
