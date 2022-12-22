class WelcomeController < ApplicationController
  def index
    render json: { message: 'Welcome' }, status: :ok
  end
end
