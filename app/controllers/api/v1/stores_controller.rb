class Api::V1::StoresController < ApplicationController

  def show
    @store = Store.find(params[:id])
    @promotions = @store.promotions

    render :json => [@store, @promotions]
  end
end
