class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    # idの降順にユーザの一覧を取得⇒必要ないかも
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    # ユーザの詳細ページ⇒必要ないかも
    @user = User.find(params[:id])
  end

  # ユーザ登録用フォーム
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      # カレンダーへ
      redirect_to blogs_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      # newを表示
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
