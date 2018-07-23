class LikesController < ApplicationController

  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like

    if like.save
      flash[:notice] = "You have liked this bookmark"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "There was a problem liking bookmark"
      redirect_to [@bookmark.topic, @bookmark]
    end

  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    authorize like

    if like.destroy
      flash[:notice] = "You have unliked this bookmark"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "There was a problem"
      redirect_to [@bookmark.topic, @bookmark]
    end

  end


end
