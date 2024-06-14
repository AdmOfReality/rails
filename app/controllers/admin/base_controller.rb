class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Нет прав для просмотра страницы.' unless current_user.is_a?(Admin)
  end
end
