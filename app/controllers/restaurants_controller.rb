class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # CRUD
  # ----
  # Create
  # Read
  # Update
  # Delete

  # Read USER ACTIONS
  #
  # 1) Read all the collection
  # 2) Read the details of a single item of the collection

  # 1) Read all the collection
  def index
    # get all the records
    @restaurants = Restaurant.all
  end

  # 2) Read the details of a single item of the collection
  def show
    # retrieve the right restaurant and make it available to the view

    # this is empty because of the `before_action` on line 2
  end

  # Create USER ACTIONS
  #
  # 1) Get the form
  # 2) Submit the form

  # 1) Get the form
  def new
    # creates a empty instance to be used in the form
    @restaurant = Restaurant.new
  end

  # 2) Submit the form
  def create
    # instantiate the new restaurant using what is coming from the form
    @restaurant = Restaurant.new(restaurant_params)

    # we need to save this restaurant to the db
    @restaurant.save

    # send the user to some other page
    # does NOT have a view!
    redirect_to restaurants_path #=> "/restaurants"
  end

  # Update USER ACTIONS
  #
  # 1) Get the form
  # 2) Submit the form

  # 1) Get the form
  def edit
    # retrieve the specific record (done by the `before_action` on line 2)

    # this is empty because of the `before_action` on line 2
  end

  # 2) Submit the form
  def update
    # retrieve the specific record (done by the `before_action` on line 2)

    # update the record using the information
    # that is coming from the form
    @restaurant.update(restaurant_params)

    # send the user to some other page
    # does NOT have a view!
    redirect_to restaurant_path(@restaurant) #=> "/restaurants/12"
  end

  # Delete USER ACTIONS
  #
  # 1) Deletes the item given it's id

  # As we don't have a GET route for this, like we have for Create/Update,
  # this means that we'll need a link somewhere that will enable the user
  # to make the DELETE request.

  # That link will sometimes be in the index, sometimes in the show, that
  # depends on the project and on the UX.

  def destroy
    # retrieve the specific record (done by the `before_action` on line 2)

    @restaurant.destroy

    # does not have a view
    # redirect the user somewhere
    redirect_to restaurants_path, status: :see_other
  end

  private

  # strong params - we use to authorize the fields that we added into the form
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurant
    # params[:id] => we use the params to retrieve dynamic values from the url
    @restaurant = Restaurant.find(params[:id])
  end
end
