class BlogsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    # binding.pry
    @blogs = current_user.blogs.order(id: :desc).page(params[:page])
    @blog = Blog.new
  end
  
  def new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    #binding.pry
    @blog = current_user.blogs.build(blog_parameter)
    
    if @blog.save
        flash[:success] = '正常に登録されました'
        redirect_to blogs_path
    else
        flash.now[:danger] = '登録されませんでした'
        redirect_to blogs_path
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = '削除しました'
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      flash[:success] = '編集しました'
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :date_time)
  end

  def correct_user
    @blog = current_user.blogs.find_by(id: params[:id])

    unless @blog
      redirect_to blogs_path
    end
  end

end
