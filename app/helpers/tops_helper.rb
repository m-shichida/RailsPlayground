module TopsHelper
  def background_color_by_feature_flag
    case FeatureFlag.new.current_flag
    when 'green_flag'
      'green'
    when 'blue_flag'
      'blue'
    when 'red_flag'
      'red'
    else
      'black'
    end
  end
end
