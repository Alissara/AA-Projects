class PostsController < ApplicationController
  before_action :require_login
  before_action :require_author, only: [:edit, :update]

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to subs_url
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids:[])
  end

  def require_author
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      flash[:errors] = ["Only authors can edit"]
      redirect_to post_url(@post)
    end
  end

end
