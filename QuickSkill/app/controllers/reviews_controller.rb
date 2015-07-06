class ReviewsController < ApplicationController

  def index 
     @post = Post.find(params[:post_id])
  end

  def create
  	@post = Post.find(params[:post_id])
    @review = @post.reviews.create(review_params)
    @review.user_id = current_user.id
    @review.save

    redirect_to post_path(@post)
  end

 def destroy
      @post = Post.find(params[:post_id])
      @review = @post.reviews.find(params[:id])
      @review.destroy
      redirect_to post_path(@post)
 end

 def edit
    @post = Post.find(params[:post_id])
    @review = Review.find(params[:id])
  end

 def update
    @post = Post.find(params[:post_id])
    @reivew = Review.find(params[:id])
    if @review.update(review_params) 
      redirect_to post_path(@post)
    else 
      render 'edit'
    end 
  end

  private
    def review_params
      params.require(:review).permit(:body, :rating)
   end

end 