class StoresController < ApplicationController

  def allStores
    render json: Store.allStores
  end

  def showStore
    render json: Store.showStore(params["id"])
  end

  def createStore
    render json: Store.createStore(params["store"])
  end

  def deleteStore
    render json: Store.deleteStore(params["id"])
  end

end
