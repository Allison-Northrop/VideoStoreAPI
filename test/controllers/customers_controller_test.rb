require "test_helper"

describe CustomersController do
  it "is a real working route" do
      get customers_path
      must_respond_with :success
    end

  it "returns json" do

  end

end
