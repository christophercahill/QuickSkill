class ProfilesController < ApplicationController

  def new 
    @user = User.find params[:user_id]
    @profile = Profile.new
  end 

#will have to change 
  def index
    @profiles = Profile.new  
  end

  def show 
    @profile = Profile.find params[:id]
    user_id = @profile.user_id
    @user = User.find(user_id)
    @posts = @user.posts.all 
  end

  def edit 
    @profile = Profile.find params[:id]
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save 
      redirect_to user_profile_path(current_user, @profile)
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
    def profile_params
      params.require(:profile).permit(:name, :location, :biography, :phone_number, :user_id)
   end
end 