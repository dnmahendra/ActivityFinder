class Api::ActivitiesController < ApplicationController

  def index
    if params[:location].nil?
      @activities = Activity.all
    else
      @activities = Activity.near(params[:location], 30)
    end

    render json: @activities.to_json({:include => :user}), status: 200
  end


  def create
    @activity = activity.new
    @activity.name = params[:name]

    @activity.save
    render json: @activities, status: 200
  end

  def show
     @activity = Activity.find(params[:id])
     render json: @activity, status: 200
  end

end
