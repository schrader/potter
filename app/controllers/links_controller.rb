class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :set_pot

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  def archive
    @links = current_pot.old_links.sent_directly_after(requested_date).decorate
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new(name: params[:name], url: params[:url])
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.pot = current_pot
    @link.user = current_user
    
    respond_to do |format|
      if @link.save

        format.html do
          if params[:return_to].present?
            redirect_to params[:return_to]
          else
            redirect_to @link.pot, notice: 'Link wurde hinzugefügt.'
          end
        end
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'pots/new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link.pot, flash: {success: 'Link wurde aktualisiert.'} }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:name, :url, :description, :hottiness)
    end
    
    def current_pot
      @current_pot ||= Pot.find(params[:pot_id])
    end
    helper_method :current_pot


    def set_pot
      @pot = current_pot
    end

    def requested_date
      CalendarWeek.new(Date.strptime(params[:calendar_week] + params[:year], "%W%Y"))
    rescue
      CalendarWeek.new(current_pot.last_delivered_at)
    end
    helper_method :requested_date

    class CalendarWeek
      delegate :to_date, :to_datetime, :strftime, :year, to: :monday

      def initialize(date)
        @monday = date.beginning_of_week
      end

      def monday
        @monday
      end

      def to_s
        @monday.strftime("%W").to_s
      end

      def to_str
        to_s
      end
    end
end
