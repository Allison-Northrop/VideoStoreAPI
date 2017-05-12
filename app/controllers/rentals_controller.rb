class RentalsController < ApplicationController
  def checkout
    movie = Movie.find_by(title: params[:title].capitalize)
    rental = Rental.new(customer_id: params["customer_id"], movie: movie, due_date: params["due_date"])
    if rental.save
      render json: { id: rental.id}, status: :ok
    else
      render status: :bad_request, json: { errors: rental.errors.messages }
    end
  end
end
