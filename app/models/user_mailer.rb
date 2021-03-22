class UserMailer < ActionMailer::Base

  def reminder(user)
    @subject = '얼트서강(alt-sogang.org)의 사용자 로그인 정보입니다.'
    @body = {}
    # Give body access to the user information.
    @body["user"] = user
    @recipients = user.email
    @from = '얼트서강 <do-not-reply@alt-sogang.org>'
  end

end