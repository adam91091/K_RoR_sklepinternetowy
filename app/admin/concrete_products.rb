ActiveAdmin.register ConcreteProduct do
  permit_params :product_id, :price, :size, :color, :amount, images: []

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :product
      f.input :price
      f.input :size
      f.input :color
      f.input :amount
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
end
