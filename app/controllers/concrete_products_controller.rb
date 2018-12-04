class ConcreteProductsController < ApplicationController
  def add_to_cart
    concrete_product = ConcreteProduct.find(params[:id])
    outcome = AddToCart.run(guest: current_guest, concrete_product: concrete_product)

    flash[:notice] = if outcome.valid?
                       'Dodano do koszyka'
                     else
                       outcome.errors.full_messages
                     end

    redirect_to products_path
  end
end
