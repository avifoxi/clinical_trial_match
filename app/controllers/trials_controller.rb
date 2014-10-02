class TrialsController < ApplicationController
  before_action :set_trial, only: [:show]

  def index
    session[:coordinates] = ""
    unless params[:pc].blank?
        session[:coordinates] =  Geocoder.coordinates("#{params[:pc]}, United States", :lookup => :google)
        if session[:coordinates].nil? || session[:coordinates] == [39.49593, -98.990005]
          flash.now[:alert] = "We are unable to detect a zip code for your location at this time."
          AdminAlerts.no_lat_long(params[:pc]).deliver
        end
    end

    @trials = Trial
      .search_for(params[:q])
      .age(params[:age])
      .control?(params[:vt])
      .gender(params[:gender])
      .type(params[:ty])
      .phase(params[:ph])
      .fda(params[:fda])
      .close_to(session[:coordinates], params[:td])
      .order(params[:ot]||"lastchanged_date DESC")
      .paginate(:page => params[:page], :per_page => 10)

    if params[:commit].present? && cookies[:signup_div_viewed].blank?
      flash[:notice] = "<p>You match to <span style='font-weight:bold;'>#{@trials.total_entries.to_i} trials</span> today! Come back as new trials come online all the time!".html_safe
    end

    trial_ids_array = []
    # @TODO: NEED TO REFACTOR TO PREVENT QUERYING THIS TWICE JUST BECAUSE OF PAGINATE.
    # @TODO: DO I NEED MEMCACHE TO SOLVE FOR RAILS.CACHE
    @all_trials = Trial.search_for(params[:q]).age(params[:age]).control?(params[:vt]).gender(params[:gender]).type(params[:ty]).phase(params[:ph]).fda(params[:fda]).close_to(session[:coordinates], params[:td]).order(params[:ot]||"lastchanged_date DESC")
    @all_trials.each {|trial| trial_ids_array << trial.id}
    Rails.cache.write('trial_ids', trial_ids_array)

    # eric's refactoring recommendation -    @sites = Site.near(params[:pc],params[:td]).where(trials_ids: @trial_ids).paginate(:page => params[:page], :per_page => 10)
    session[:search_results] = request.url
    session[:age] = params[:age]
    session[:vt] = params[:vt]
    session[:gender] = params[:gender]
    session[:pc] = params[:pc]
    session[:td] = params[:td]

  end


  def show
    # @TODO? I'm running distance_from in both the controller and view. Should this just be done in the model??
    if session[:coordinates].blank?
      @sites = @trial.sites
    else
      @sites = @trial.sites.sort_by{|site| site.distance_from(session[:coordinates])}
    end

    # BUILDING PREVIOUS NEXT BUTTONS OFF OF USERS SEARCH QUERY
    trial_ids = Rails.cache.read('trial_ids')
    tmpIndex = trial_ids.index(params[:id].to_i)

    if trial_ids && tmpIndex
      @next_trial = trial_ids[tmpIndex+1]
      @previous_trial = trial_ids[tmpIndex-1]
    end

  end

  private

  def set_trial
    @trial = Trial.find(params[:id])
  end

  def trial_params
    params.require(:trial).permit(:title, :description, :sponsor, :country, :focus)
  end
end
