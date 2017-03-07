class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized, only: [:home]
  after_action :verify_policy_scoped, only: [:home], unless: :skip_pundit?

  def home
  end

private

end
