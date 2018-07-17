class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])

  end

  def update
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Your bookmarks was successfully deleted"
      redirect_to topics_path
    else
      flash[:alert] = "There was a problem"
      render :show
    end
  end

end
