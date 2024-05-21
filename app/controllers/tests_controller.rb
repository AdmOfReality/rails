class TestsController < ApplicationController

  before_action :find_test, only: %i[ show destroy update edit start ]
  before_action :find_user, only: %i[ start ]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def show; end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_user
    @user = User.first
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :owner_id)
  end

end
