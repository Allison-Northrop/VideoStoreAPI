require "test_helper"

describe RentalsController do
  describe "checkout" do

    it "a real working route" do
      customer = customers(:stout)
      movie = movies(:jaws)
      post checkout_path(customer_id: customer.id, title: movie.title, due_date: "2017-09-12")
      must_respond_with :success
    end

    it "decreases the available inventory by one if the movie is found and the avialable inventory is more than 0" do
      customer = customers(:stout)
      movie = movies(:jaws)
      post checkout_path(customer_id: customer.id, title: movie.title, due_date: "2017-09-12")

      movie.available_inventory.must_equal movie.inventory - 1
      must_respond_with :success
    end

    it "renders a bad request status if the available inventory is less than 0" do skip
      customer = customers(:stout)
      movie = Movie.new(title: "jaws", overview: "here is an overview", release_date: "1960-06-16", inventory: 0)

        post checkout_path(customer_id: customer.id, title: movie.title, due_date: "2017-09-12")
        # post checkout_path(customer_id: customer.id, title: movie.title, due_date: "2017-09-11")

      must_respond_with :bad_request

    end

    it "renders a status ok if the rental is succesffully created" do
    end

    it "renders a bad request if the rental wasn't saved" do skip 
      # customer = customers(:stout)
      # post checkout_path(customer_id: customer.id, title: "", due_date: "2017-09-12")
      Rental.new(customer_id: 1)
      must_respond_with :bad_request
    end

  end
end
