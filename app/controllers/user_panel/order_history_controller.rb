module UserPanel
  class OrderHistoryController < ApplicationController
    def index
      @history_orders = current_user.orders
    end

    def show
      @history_order = current_user.orders.find(params[:id])
    end
  end
end
