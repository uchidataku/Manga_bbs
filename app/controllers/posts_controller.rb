class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @responses = @post.responses
  end
  
  def new
    @user = current_user
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_paramas)
    if @post.save
      flash[:success] = "スレッドを作成しました"
      redirect_to root_path
    else
      flash[:danger] = "スレッドを作成できませんでした"
      redirect_to new_user_post_path
    end
  end
  
  private
    def post_paramas
      params.require(:post).permit(:user_id, :title, :text, category_ids: [])
    end
end
