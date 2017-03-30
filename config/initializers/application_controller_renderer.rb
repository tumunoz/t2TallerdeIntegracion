class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
 

  def render_not_found_response()
    render json: { error: "La creacion ha fallado"}, status: "500"
  end

  def render_not_found_response()
    render json: { error: "Usuario no encontrado"}, status: "404"
  end
end