module UserPanel
  class AccountManagementController < ApplicationController
    def show 
      @user = current_user
    end
    
    def update
      @user = current_user
      if @user.update_attributes(post_params)
        flash[:notice] = "Your account informations was changed successfully"
        redirect_to user_panel_account_management_path
      else
        flash[:notice] = "Error"
        redirect_to user_panel_account_management_path
      end
    end  

    private

    def post_params
      params.require(:user).permit(:name, :surname)
    end
  end
end
