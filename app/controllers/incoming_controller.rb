class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    puts "$$$$$$$$$$$$$$$$$$$$$"

    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])

    @url = params["body-plain"]

    if @user.nil?
      @user = User.new(email: params[:sender], password: "temp0rary_passw0rd")
      @user.skip_confirmation!
      @user.save!
    end

    if @topic.nil?
      @topic = Topic.create!(title: params[:subject], user: @user)
    end

    @bookmark = @topic.bookmarks.create(url: @url)

    head 200
  end

end
