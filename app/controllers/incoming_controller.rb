class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS: #{params}"

    @topic = Topic.new
    @topic.title = params[:subject]
    @topic.user = params[:sender]

    url = params["body-plain"]

    @bookmark = @topic.bookmarks.build(url)
  end

end
