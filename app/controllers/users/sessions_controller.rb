# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Aloha, #{current_user.first_name} #{current_user.last_name}!"
  end
end
