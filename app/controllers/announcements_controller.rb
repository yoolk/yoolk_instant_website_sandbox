class AnnouncementsController < ApplicationController
  def index
  end

  def show
    @announcement = @listing.announcements.find { |announcement| announcement.id == params[:id].to_i }
  end
end