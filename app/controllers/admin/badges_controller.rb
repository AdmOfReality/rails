class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update destroy]
  before_action :set_badge_rules, only: %i[new edit create update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.delete')
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image, :badge_rule_id)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def set_badge_rules
    @badge_rules = BadgeRule.all
  end
end
