ActiveAdmin.register Comment do
	permit_params :content, :product_id
end
