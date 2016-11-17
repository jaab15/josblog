class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
      @user = User.new user_params
      if @user.save
         session[:user_id] = @user.id
         redirect_to root_path, notice: "Logged In!"
      else
         render :new
      end
  end

  def edit
      @user = User.find params[:id]
  end



  def update
      @user = User.find(params[:id])
      require_user
      byebug
      if    params[:old_password] == params[:password]
            render 'edit',
            notice: "The new password have to be different from the old one!"
      elsif @user.update(@user_params)
            redirect_to root_path, notice: "Changed saved thanks!"
      else
         render 'edit'
      end
  end


 private

   def user_params
       params.require(:user).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :password,
                                    :password_confirmation)
   end

   def require_user
       @user_params = params.require(:user).permit(
                                                  :first_name,
                                                  :last_name,
                                                  :email,
                                                  :password,
                                                  :password_confirmation)
   end


end
