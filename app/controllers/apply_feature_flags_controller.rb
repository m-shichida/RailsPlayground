class ApplyFeatureFlagsController < ApplicationController
  def create
    FeatureFlag.new.save(permitted_params[:feature_flag])

    redirect_to root_path
  end

  private

  def permitted_params
    params.permit(:feature_flag)
  end
end
