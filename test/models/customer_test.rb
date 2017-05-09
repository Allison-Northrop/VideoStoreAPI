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

  end
end
