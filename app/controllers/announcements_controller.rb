class AnnouncementsController < ApplicationController
  def index
  end

  def show
    @announcement = @listing.announcements.select{|announcement| announcement.id == params[:id].to_i }[0]
  end
end