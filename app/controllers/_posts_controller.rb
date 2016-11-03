class PostsController < ApplicationController

  def new
     @post = Post.new
  end

  def edit
      require_post
      @post = Post.find params[:id]
  end

  def create
      require_post

      @post = Post.new(@post_params)
      # @product.user = current_user

      if  @post.save
          redirect_to root_path(@post)
      else
          render :new
      end
  end

  def show
      @post = Post.find params[:id]
  end

  def destroy
      @post = Post.find params[:id]
      @post.destroy
      redirect_to root_path
  end

  def update
      @post = Post.find(params[:id])
      require_post

      if @post.update(@post_params)
         redirect_to post_path
      else
         render 'edit'
     end
  end

  end

  private

  def require_post
      @post_params = params.require(:post).permit(
                                                 :title,
                                                 :body
                                           )
   end
