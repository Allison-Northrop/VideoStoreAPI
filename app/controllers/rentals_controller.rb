class RentalsController < ApplicationController
  def checkout
    movie = Movie.find_by(title: params[:title].capitalize)

    if movie && movie.available_inventory <= 0
      render status: :bad_request, json: { errors: { inventory: ["#{movie.title} is not in stock"] } }
    else
      rental = Rental.new(customer_id: params["customer_id"], movie: movie, due_date: params["due_date"])
      if rental.save
        # movie.reduce_inventory
        render json: { id: rental.id }, status: :ok
      else
        render status: :bad_request, json: { errors: rental.errors.messages }
      end
    end
  end

  def checkin
  # Assuming that no customer is going to have more than one copy of a movie checkout
  # If so, we would redesign the params passed in so given rental id.
    movie = Movie.find_by(title: params[:title].capitalize)
    rental = Rental.find_by(movie: movie, customer_id: params["customer_id"])
    if movie && rental
      if rental.returned
        render status: :bad_request, json: { errors: { retnal: ["Already returned #{movie.title}."]  } }
      else
        # movie.increase_inventory
        rental.update_attributes(returned: true)
        render json: { id: rental.id, returned: rental.returned }, status: :ok
      end
    else
      render status: :not_found, json: { errors: { rental: ["Rental of '#{params[:title]}' not found"] } }
    end
  end
end
