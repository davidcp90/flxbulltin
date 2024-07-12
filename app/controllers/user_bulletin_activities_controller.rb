class UserBulletinActivitiesController < ApplicationController
  before_action :set_user_bulletin_activity, only: %i[ show update destroy ]

  # GET /user_bulletin_activities
  def index
    @user_bulletin_activities = UserBulletinActivity.all

    render json: @user_bulletin_activities
  end

  # GET /user_bulletin_activities/1
  def show
    render json: @user_bulletin_activity
  end

  # POST /user_bulletin_activities
  def create
    @user_bulletin_activity = UserBulletinActivity.new(user_bulletin_activity_params)

    if @user_bulletin_activity.save
      render json: @user_bulletin_activity, status: :created, location: @user_bulletin_activity
    else
      render json: @user_bulletin_activity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_bulletin_activities/1
  def update
    if @user_bulletin_activity.update(user_bulletin_activity_params)
      render json: @user_bulletin_activity
    else
      render json: @user_bulletin_activity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_bulletin_activities/1
  def destroy
    @user_bulletin_activity.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_bulletin_activity
      @user_bulletin_activity = UserBulletinActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_bulletin_activity_params
      params.require(:user_bulletin_activity).permit(:user_id, :bulletin_id, :viewed, :ack)
    end
end
