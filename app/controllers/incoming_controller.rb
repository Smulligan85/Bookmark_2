class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    # Find the user by using params[:sender]
    @user = User.find_by(email: params[:sender])

    # Check if user is nil, if so, create and save a new user
    if @user.nil?
      return head 500
    end
     
    # Find the topic by using params[:subject]
    @topic = Topic.find_by(title: params[:subject])

    # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = params["body-plain"]


    # Check if the topic is nil, if so, create and save a new topic
    if @topic.nil?
      @topic = @user.topics.create(title: params[:subject])
    end
    
    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = @topic.bookmarks.create(url: @url)
    # Assuming all went well. 
    head 200
  end
  end