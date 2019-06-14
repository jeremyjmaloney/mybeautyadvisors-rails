class WeeksController < ApplicationController

  def allWeeks
    render json: Week.allWeeks
  end

  def showWeek
    render json: Week.showWeek(params["id"])
  end

  def createWeek
    render json: Week.createWeek(params["week"])
  end

  def deleteWeek
    render json: Week.deleteWeek(params["id"], params["weekId"])
  end

end
