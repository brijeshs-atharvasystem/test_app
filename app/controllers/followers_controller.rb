class FollowersController < ApplicationController
  before_action :authenticate_user!

  def follow_user
    user = User.find_by_id(params[:id])
    redirect_to root_path and return if user.nil? || current_user.id == user.id
    if current_user.following?(user)
      flash[:error] = 'Already following'
    else
      current_user.follow(user)
      flash[:notice] = "User is now following to #{user.email}"
    end
    redirect_to root_path
  end

  def follow_topic
    topic = Topic.find_by_id(params[:id])
    redirect_to root_path and return if topic.nil?
    if current_user.following?(topic)
      flash[:error] = 'Already following'
    else
      current_user.follow(topic)
      flash[:notice] = "User is now following to #{topic.name}"
    end
    redirect_to root_path
  end
end
