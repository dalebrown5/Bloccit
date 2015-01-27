class FavoritesController < ApplicationController

  def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)

     authorize favorite
 
     if favorite.save
      flash[:notice] = "Marked as favorite."
      redirect_to [@post.topic, @post]
     else
       flash[:error] = "Favorite not marked."
       redirect_to [@post.topic, @post]
     end
  end

  def destroy
      @post = Post.find(params[:post_id])
      favorite = current_user.favorites.find(params[:id]) 

      authorize favorite  
 
    if favorite.destroy
      flash[:success] = "Removed as favorite."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Favorite not removed."
      redirect_to [@post.topic, @post]
    end
  end

end
