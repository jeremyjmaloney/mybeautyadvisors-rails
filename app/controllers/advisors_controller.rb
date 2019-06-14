class AdvisorsController < ApplicationController

  def allAdvisors
    render json: Advisor.allAdvisors(params["storeNum"])
  end

  def showAdvisor
    render json: Advisor.showAdvisor(params["storeNum"], params["id"])
  end

  def createAdvisor
    render json: Advisor.createAdvisor(params["advisor"])
  end

  def deleteAdvisor
    render json: Advisor.deleteAdvisor(params["id"])
  end

end
