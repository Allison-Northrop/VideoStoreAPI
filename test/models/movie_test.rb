require "test_helper"

describe Movie do
  # let(:movie) { Movie.new }
  #
  # it "must be valid" do
  #   value(movie).must_be :valid?
  # end

  describe "relations" do
    it "has a list of customers" do
      jaws = movies(:jaws)
      jaws.must_respond_to :customers
      jaws.customers.each do |customer|
        customer.must_be_kind_of Customer
      end
    end

    it "has a list of rentals" do
      jaws = movies(:jaws)
      jaws.must_respond_to :rentals
      jaws.rentals.each do |rental|
        rental.must_be_kind_of Rental
      end
    end
  end
end
