class ApplicationMailer < ActionMailer::Base
  default from: %{"Rails" <mail@testrails.com>}
  layout "mailer"
end
