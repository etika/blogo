class PostsController < ApplicationController
	# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
  	if current_user.role == "admin"
      @posts = Post.all
    else
      @posts =Post.where(status: true)
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def change_status
    post= Post.find(params[:id].to_i)
    post.update_attributes(status: params[:status])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to pPosts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body,:image,:user_id)
  end
end
