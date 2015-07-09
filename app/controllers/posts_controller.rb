class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 2)
  end
  
  def show

  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.save
      flash[:success] = "Your post was successfully created"
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit

  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "Your post was successfully updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def like
    like = Like.create(like: params[:like], user: current_user, post: @post)
    if like.valid?
      flash[:success] = "Your vote has been counted."
      redirect_to :back
    else
      flash[:danger] = "You can only vote once."
      redirect_to :back
    end
  end
  
  private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def require_same_user
      if current_user != @post.user
      flash[:danger] = "You can only edit your own posts!"
      redirect_to posts_path
      end
    end
    
end






