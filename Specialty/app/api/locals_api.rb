class Locals_API < Grape::API
  resource "locals" do

    # ex) http://localhost:3000/api/v1/locals
    desc "returns all locals"
    get do
      Local.all
    end

    desc "return a local"
    params do
      requires :id, type: Integer
      optional :name, type: String
    end
    # http://localhost:3000/api/v1/locals/{:id}
    get ':id' do
      Local.find(params[:id])
    end
  end
end
