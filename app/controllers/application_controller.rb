class ApplicationController < ActionController::API
  def root
    render json:{ message: "Fullstack Challenge 20201026" }
  end
end
