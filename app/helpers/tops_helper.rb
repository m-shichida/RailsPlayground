module TopsHelper
  def background_color_by_feature_flag
    if FeatureFlag.enabled?(:green_flag)
      'green'
    elsif FeatureFlag.enabled?(:blue_flag)
      'blue'
    elsif FeatureFlag.enabled?(:red_flag)
      'red'
    else
      'black'
    end
  end
end
