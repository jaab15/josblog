class PostsController < ApplicationController

  def index
      pagine
  end
  def forgitexo
  end
  def new
      @post = Post.new
  end

  def show
      @post = Post.find params[:id]
  end

  def edit
      # require_post
      @post = Post.find params[:id]
  end

  def pagination
      pagine
  end

  def search
      @nbrReq = Post.calculate_nbr_req(params[:query])
      calc_HowManyPages
      if params[:page].to_i == 0
         params[:page] = 1
      end

      @pageoff = (params[:page].to_i - 1) * NBR_LINE
      @posts = Post.search_pag(params[:query], @pageoff)
  end

  def create
      require_post

      @post = Post.new(@post_params)
      # @product.user = current_user

      if  @post.save
          redirect_to posts_path(@post)
      else
          render :new
      end
  end

  def destroy
      @post = Post.find params[:id]
      @post.destroy
      redirect_to posts_path
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

  private
  def post_params
      params.require(:post).permit(:title, :body)
  end

  def require_post
      @post_params = params.require(:post).permit(
                                                 :title,
                                                 :body
                                                 )
  end

  def pagine
      @nbrReq = Post.count
      calc_HowManyPages

      if params[:page].to_i == 0
         params[:page] = 1
      end

      @pageoff = (params[:page].to_i - 1) * NBR_LINE
      @posts = Post.all.limit(NBR_LINE).offset(@pageoff)
  end

  def calc_HowManyPages
      if @nbrReq != nil && @nbrReq != 0
         @nbrPage = (@nbrReq / NBR_LINE).ceil
         if @nbrReq % NBR_LINE > 0
            @nbrPage = @nbrPage + 1
         end
      end
  end

end
