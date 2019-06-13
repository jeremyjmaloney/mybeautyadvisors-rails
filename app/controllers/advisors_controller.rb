class AdvisorsController < ApplicationController

  def allAdvisors
    render json: Advisor.all
  end

  def showAdvisor
    render json: Advisor.find(params["id"])
  end

  def createAdvisor
    render json: Advisor.create(params["advisor"])
  end

  def deleteAdvisor
    render json: Advisor.delete(params["id"], params["date"])
  end

end
