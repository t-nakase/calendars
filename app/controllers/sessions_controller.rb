class SessionsController < ApplicationController
  # ログインフォーム
  def new
  end

  # ログイン処理
  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      # users#showへ⇒カレンダーへ変更
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      # ログインフォームへ
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end

end
