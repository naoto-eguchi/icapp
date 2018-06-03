class IcMailer < ApplicationMailer
  def ic_mail(ic)
    @ic = ic
    mail to: @ic.user.email, subject: "投稿しました！"
  end
end
