class BookmarksController < ApplicationController
  before_action :get_topic
  before_action :authenticate_user!, except: [:show]

  def show
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def edit
    @bookmark = @topic.bookmarks.find(params[:id])

  end

  def update
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Your bookmark was updated"
      redirect_to [@topic, @bookmark]
    else
      render :edit
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Your bookmark was saved"
      redirect_to [@topic, @bookmark]
    else
      render :new
    end
  end

  def destroy
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Your bookmarks was successfully deleted"
      redirect_to topics_path
    else
      flash[:alert] = "There was a problem"
      render :show
    end
  end

  private

  def get_topic
    @topic = Topic.find(params[:topic_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
