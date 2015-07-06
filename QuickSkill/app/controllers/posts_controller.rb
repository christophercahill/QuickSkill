class PostsController < ApplicationController

  def new 
    @post = Post.new
  end 

#will have to change 
  def index
    @all_posts = Post.all 
    @posts = []
  end

  def show 
    @post = Post.find params[:id]
  end

  def edit 
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save 
      redirect_to posts_path(current_user)
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

  def destroy
      @post = Post.find params[:id]
      @post.destroy
      redirect_to posts_path(current_user)
  end

  private
    def post_params
      params.require(:post).permit(:title, :topic, :price, :location, :description, :looking_for)
   end
end 