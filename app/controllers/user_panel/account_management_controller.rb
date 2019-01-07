module UserPanel
  class AccountManagementController < ApplicationController
    def show
      @user = current_user
    end

    def update
      @user = current_user
      flash[:notice] = if @user.update_attributes(post_params)
                         'Your account informations was changed successfully'
                       else
                         'Error'
                       end
      redirect_to user_panel_account_management_path
    end

    private

    def post_params
      params.require(:user).permit(:name, :surname, :email, :address, :city, :zip_code, :phone, :country)
    end
  end
end
