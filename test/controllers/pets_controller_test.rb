require 'test_helper'

describe PetsController do
  describe "index" do
    it "gives all the pets" do
      Pet.count.must_be :>, 0

      get pets_path

      must_respond_with :success
      body = JSON.parse(response.body, symbolize_names: true)
      body.must_be_kind_of Array
      body.length.must_equal Pet.count
    end

    it "works with no pets" do
      Pet.destroy_all

      get pets_path

      must_respond_with :success
      body = JSON.parse(response.body, symbolize_names: true)
      body.must_be_kind_of Array
      body.length.must_equal 0
    end
  end

  describe "create" do
    let (:pet_data) {{name: 'socks', age: 5, owner: 'bill'}}
    it "works with a valid pet" do
      Pet.new(pet_data).must_be :valid?
      before_pet_count = Pet.count

      post pets_path, params: pet_data

      must_respond_with :success
      Pet.count.must_equal before_pet_count + 1
      body = JSON.parse(response.body, symbolize_names: true)
      body.must_include :id
      body[:id].must_equal Pet.last.id
    end

    it "fails gracefully with an invalid pet" do
      pet_data[:name] = nil
      p = Pet.new(pet_data)
      p.wont_be :valid?
      p.errors.messages.must_include :name

      before_pet_count = Pet.count

      post pets_path, params: pet_data

      must_respond_with :bad_request
      Pet.count.must_equal before_pet_count
      body = JSON.parse(response.body, symbolize_names: true)
      body.must_include :errors
      body[:errors].must_include :name
    end
  end
end
