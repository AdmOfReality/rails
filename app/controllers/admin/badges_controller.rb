class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: 'Бэйдж успешно создан.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: 'Бэйдж обновлён.'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: 'Бэйдж удалён.'
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image, :rule)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
