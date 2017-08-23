class FollowMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.follow_mailer.followed.subject
  #
  def followed
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.follow_mailer.unfollowed.subject
  #
  def unfollowed
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
