class ApplicationMailer < ActionMailer::Base
  default from: 'deploy@events-liker.site'
  layout 'mailer'
end
