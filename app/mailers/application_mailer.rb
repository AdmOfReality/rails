# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("Rails" <mail@testrails.com>)
  layout 'mailer'
end
