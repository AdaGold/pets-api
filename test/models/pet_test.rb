require 'test_helper'

describe Pet do
  describe "validations" do
    let (:pet_data) {{name: 'socks', age: 5, owner: 'bill'}}
    it "Can be created with all values" do
      pet = Pet.new(pet_data)
      expect(pet).must_be :valid?
    end

    it "Requires a name" do
      pet_data[:name] = nil
      pet = Pet.new(pet_data)
      expect(pet).wont_be :valid?
    end
  end
end
