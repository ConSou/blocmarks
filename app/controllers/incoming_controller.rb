class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS: #{params}"

    @topic = Topic.new
    @topic.Topic.create(title: params[:subject])
    @topic.user = params[:sender]

    url = params["body-plain"]

    @bookmark = @topic.bookmarks.build(url)
    head 200
  end

end
