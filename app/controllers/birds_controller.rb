class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  #patch /bird/:id
  def update
    #find instance
    bird = Bird.find_by(id:params[:id])

    #if found, update instance
    if bird
      bird.update(bird_params)

      #return instance in json format
      render json: bird, status: :created
    else
      render json: {error: "data not found"}, status: :not_found
  end

  # breaking RESTFUL CONVENTIONS by adding custom action/method to handle "likes" button click action.

  # BEST PRACTICE, CREATE DIFFERENT CONTROLLER FOR CUSTOM ROUTES
  # http://jeromedalbert.com/how-dhh-organizes-his-rails-controllers/
  def increment_likes

      #find bird instance
      bird = Bird.find_by(id:params[:id])

      #if found, increment likes by 1
      if bird
        bird.update(likes: bird.likes + 1)
        
        #return instance in json format
        render json: bird
      else
        render json: {error: "data not found"}, status: :not_found
      end
  end

  private

  def bird_params
    # params.permit(:name, :species)

    #include :likes to allowed parameters
    params.permit(:name, :species, :likes)
  end

end
