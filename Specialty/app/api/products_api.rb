class Products_API < Grape::API
  resource "products" do

    # ex) http://localhost:3000/api/v1/products
    # ex) http://localhost:3000/api/v1/products?local_id=1
    desc "returns all products"
    get do
      if params[:local_id].nil?
        Product.all
      else
        Product.find_by(local_id: params[:local_id])
      end
    end

    desc "return a product"
    params do
      requires :id, type: Integer
      optional :name, type: String
      optional :local_id, type: Integer
    end
    # http://localhost:3000/api/v1/products/{:id}
    get ':id' do
      Product.find(params[:id])
    end
  end
end
