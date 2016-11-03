class CommentsController < ApplicationController
  before_action :find_post

  def index
  end

  def show
      @comments = @post.comments.count
  end

  def edit
      find_post
      @comment = @post.comments.find params[:id].to_i
  end

  def new
      @comment = @post.comments.build
  end

  def create
     require_comment
     @comment = Comment.new @comment_params
    #  @comment.user = current_user
     @comment.post = @post

     if @comment.save
        redirect_to post_path(@post)
     else
        render :action => :new
     end
  end

  def update
      @comment = Comment.find params[:id]
      require_comment

      if @comment.update(@comment_params)
         redirect_to post_path(@comment)
      else
         render 'edit'
      end
  end

  def destroy
      @comment = @post.comments.find_by_id(params[:id])
      @comment.destroy

       redirect_to post_path(@post),
                   :notice => 'Comment deleted'
  end


  private

  def find_post
      @post = Post.find params[:post_id]
  end

  def require_comment
      @comment_params = params.require(:comment).permit(
                                                    :body
                                                    )
  end

  # def find_category
  #       @category = Category.find params[:category_id]
  # end

end
