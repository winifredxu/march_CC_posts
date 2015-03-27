class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    # Fetching all the posts from the database
    @posts = Post.most_recent
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  # GET /posts/3
  def show
  end

  # get /posts/4/edit
  def edit    
  end

  # patch /posts/4
  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:alert] = "Can't update"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted"
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params 
    params.require(:post).
                    permit(:title, :description, 
                            :price, :location)
  end

end
