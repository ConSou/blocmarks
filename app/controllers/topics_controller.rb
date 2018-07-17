class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.order("title ASC")
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic = Topic.create(topic_params)
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Your topic was added"
      redirect_to @topic
    else
      render :new
    end

  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic was updated successfully"
      redirect_to @topic
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "#{@topic.title} was successfully deleted"
      redirect_to topics_path
    else
      flash[:alert] = "There was an error removing topic at this time"
      redirect_to topics_path
    end

  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
