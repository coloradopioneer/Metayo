class PostsController < ApplicationController
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 2)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = User.find(1)
    
    if @post.save
      flash[:success] = "Your post was successfully created"
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Your post was successfully updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def like
    @post = Post.find(params[:id])
    like = Like.create(like: params[:like], user: User.first, post: @post)
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

end






