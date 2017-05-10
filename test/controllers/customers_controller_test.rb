require "test_helper"

describe CustomersController do
  describe "index" do
    it "is a real route" do
      get customer_url
      must_respond_with :success
    end
  end
end
