class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

 
  # GET /links/new
  def new
    @link = LinkCreator.new(name: params[:name], url: params[:url])
  end

  # POST /links
  # POST /links.json
  def create
    @link = LinkCreator.new(link_params)
    Rails.logger.debug(link_params)

    @link.user = current_user
    
    respond_to do |format|
      if @link.save

        format.html do
          if params[:return_to].present?
            redirect_to params[:return_to]
          else
            redirect_to root_url, notice: 'Link wurde hinzugefügt.'
          end
        end
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'pots/new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:name, :url, :description, :hottiness, pot_ids: [  ])
    end
end
