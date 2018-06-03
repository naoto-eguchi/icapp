class UsersController < ApplicationController
    def new
      @user = User.new
    end
    
    def show
      @user = User.find(params[:id])
      # @favorite_ics = current_user.favorite_ics.find_by(user_id: @user.id)
      @favorite_ics = @user.favorite_ics
    end
    
    def create
       @user = User.new(user_params)
     if @user.save
       redirect_to user_path(@user.id)
     else
       render"new"
     end
    end
    
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation, :image)
  end
    
end
