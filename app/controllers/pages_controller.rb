class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, :except => :artwork_guidelines

  def terms_and_conditions
  end

  def license_agreement
  end

  def artwork_guidelines
  end

  def privacy_policy
  end

  def website_disclaimer
  end

  def copyright_notice
  end

  def legal
  end

end
