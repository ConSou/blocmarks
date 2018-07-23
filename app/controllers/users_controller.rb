class UsersController < ApplicationController
  def show
    @bookmarks = Bookmark.where(user: current_user)
    @likes = current_user.likes
  end
end
