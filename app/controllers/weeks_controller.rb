class WeeksController < ApplicationController

  def allWeeks
    render json: Week.allWeeks(params["advisorId"])
  end

  def showWeek
    render json: Week.showWeek(params["advisorId"], params["id"])
  end

  def createWeek
    render json: Week.createWeek(params["week"])
  end

  def deleteWeek
    render json: Week.deleteWeek(params["id"])
  end

end
