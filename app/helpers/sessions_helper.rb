module SessionsHelper
  def current_user
    # 既に現在のログインユーザが代入されていたら何もせず、
    # 代入されていなかったらログインユーザを取得する
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザがログインしていればtrue
  def logged_in?
    !!current_user
  end
end
