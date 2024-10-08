class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @matched_user = nil

    if params[:search_match].present?
      matcher = UserMatcher.new(current_user)
      @matched_user = matcher.find_matching_user

      if @matched_user
        flash.now[:notice] = "Benutzer gefunden: #{@matched_user.name || @matched_user.email}"
      else
        flash.now[:alert] = "Kein passender Benutzer gefunden."
      end
    end
  end

  def export_csv
    CsvExportJob.perform_later(current_user)

    flash[:notice] = "Der CSV-Export wurde gestartet."
    redirect_to dashboard_path
  end
  def find_match
    matcher = UserMatcher.new(current_user)
    @matched_user = matcher.find_matching_user

    if @matched_user
      flash[:notice] = "Benutzer gefunden: #{@matched_user.name || @matched_user.email}"
    else
      flash[:alert] = "Kein passender Benutzer gefunden."
    end
    redirect_to dashboard_path(search_match: true)
  end
end
