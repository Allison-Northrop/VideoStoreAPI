require "test_helper"

describe "Customer" do
  describe "Validations" do
    it "Requires a name" do
      customer = Customer.create
      result = customer.valid?
      result.must_equal false
      customer.errors.messages.must_include :name
    end

    it "requires a phone number" do
      customer = Customer.create
      result = customer.valid?
      result.must_equal false
      customer.errors.messages.must_include :phone
    end

    it "requires a postal code" do
      customer = Customer.create
      result = customer.valid?
      result.must_equal false
      customer.errors.messages.must_include :postal_code
    end

    it "checks the length isn't greater than 5 for the postal code" do
      customer = Customer.create(postal_code: "9832928938")
      result = customer.valid?
      result.must_equal false
    end

    it "checks the length of the postal code is not less than 5" do
      customer = Customer.create(postal_code: "9")
      result = customer.valid?
      result.must_equal false
    end
  end
end
