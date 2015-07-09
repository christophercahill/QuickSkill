class PostsController < ApplicationController

  def new 
    @post = Post.new
  end 
 
  def index
    @posts = Post.all 
    
  end

  def search
    @posts = Post.search(params[:search])
    render :index
  end


  def looking_for 
    @all_posts = Post.all
    @posts = []
    @all_posts.each do |post|
      if post.looking_for == false
        @posts << post 
      end 
    end 
    @posts 
  end 

  def offering  
    @all_posts = Post.all
    @posts = []
    @all_posts.each do |post|
      if post.looking_for 
        @posts << post 
      end 
    end 
    @posts 
  end 

  def show 
    @post = Post.find params[:id]
    user_id = @post.user_id
    @user = User.find(user_id)
    @profile = @user.profile 
  end

  def edit 
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save 
      redirect_to post_path(@post)
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
      params.require(:post).permit(:title, :topic_id, :price, :location, :description, :looking_for)
   end
end 