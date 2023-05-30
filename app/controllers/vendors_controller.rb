class VendorsController < ApplicationController

  def show
    @facade = VendorFacade.new(params[:id])
  end
end