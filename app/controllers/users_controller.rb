class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
    @birthday_user = User.birthday_user
  end

  def show
    @user_presenter = UserPresenter.new(@user)
  end

  def new
    @user_form = UserForm.new
  end

  def edit
  end

  def create
    @user_form = UserForm.new(user_params)
      if @user_form.save
        redirect_to users_path, notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @user_form.update(user_params)
        redirect_to users_path, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @user.destroy
      redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user_form).permit(:first_name, :last_name, :email, :birth_date)
    end
end
