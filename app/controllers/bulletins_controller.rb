class BulletinsController < ApplicationController
  before_action :set_bulletin, only: %i[ show update destroy ]

  # GET /bulletins
  def index
    if current_user.admin?
      @bulletins = Bulletin.joins(:team).where(teams: { organization_id: current_user.organization_id })
    else
      @bulletins = Bulletin.joins(:team).where(teams: { id: current_user.team_ids })
    end

    if params[:status].present? && %w[draft published].include?(params[:status])
      @bulletins = @bulletins.where(status: params[:status])
    end

    @bulletins = @bulletins.page(params[:page]).per(params[:per_page] || 10)

    render json: @bulletins
  end

  # GET /bulletins/1
  def show
    render json: @bulletin
  end

  # POST /bulletins
  def create
    @bulletin = Bulletin.new(bulletin_params)

    if @bulletin.save
      render json: @bulletin, status: :created, location: @bulletin
    else
      render json: @bulletin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bulletins/1
  def update
    if @bulletin.update(bulletin_params)
      render json: @bulletin
    else
      render json: @bulletin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bulletins/1
  def destroy
    @bulletin.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulletin
      @bulletin = Bulletin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bulletin_params
      params.require(:bulletin).permit(:title, :slug, :summary, :created_at, :publishing_date, :author, :content, :ack_required, :send_email, :cover_image)
    end
end
