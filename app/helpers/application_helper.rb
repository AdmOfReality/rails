# frozen_string_literal: true

module ApplicationHelper
  def flash_bootstrap(key)
    if key == 'alert'
      key = 'danger'
    elsif key == 'notice'
      key = 'primary'
    end
  end
end
