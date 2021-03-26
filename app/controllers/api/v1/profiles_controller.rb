class Api::V1::ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @profiles = Profile.all
  end
end
