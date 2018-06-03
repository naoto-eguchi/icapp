class FavoritesController < ApplicationController
   def create
    favorite = current_user.favorites.create(ic_id: params[:ic_id])
    redirect_to ics_url, notice: "#{favorite.ic.user.name}さんの投稿をお気に入り登録しました"
   end

  def destroy
    favorite = current_user.favorites.find_by(ic_id: params[:ic_id]).destroy
    redirect_to ics_url, notice: "#{favorite.ic.user.name}さんの投稿をお気に入り解除しました"
  end
end
