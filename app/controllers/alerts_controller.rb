class AlertsController < ApplicationController
  def index
    @alerts = Alert.all
    render json: @alerts.map { |alert|
      {
        id: alert.id,
        type: alert.type,
        description: alert.description,
        origin: alert.origin,
        tags: alert.tags.map(&:name),
        created_at: alert.created_at_in_words
      }
    }
  end

  def create
    @alert = Alert.new(alert_params)
    @alert.tag_names(params[:alert][:tag_names])
    if @alert.save
      render json: {
        id: @alert.id,
        type: @alert.type,
        description: @alert.description,
        origin: @alert.origin,
        tags: @alert.tags.map(&:name)
      }, status: :created
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:type, :description, :origin)
  end
end
