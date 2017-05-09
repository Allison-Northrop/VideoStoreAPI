require "test_helper"

describe Customer do
  # let(:customer) { Customer.new }
  #
  # it "must be valid" do
  #   value(customer).must_be :valid?
  # end

  describe "relations" do
    it "has a list of rentals" do
      stout = customers(:stout)
      stout.must_respond_to :rentals
      stout.rentals.each do |rental|
        rental.must_be_kind_of Rental
      end
    end

    it "has a list of movies" do
      stout = customers(:stout)
      stout.must_respond_to :movies
      stout.movies.each do |movie|
        movie.must_be_kind_of Movie
      end
    end
  end
end
