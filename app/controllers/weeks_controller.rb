class WeeksController < ApplicationController

  def allWeeks
    render json: Week.all
  end

  def showWeek
    render json: Week.find(params["id"])
  end

  def createWeek
    render json: Week.create(params["week"])
  end

  def deleteWeek
    render json: Week.delete(params["id"], params["date"])
  end

end
