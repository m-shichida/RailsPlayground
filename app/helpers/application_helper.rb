module ApplicationHelper
  def feature_flags
    feature_flag_path = Rails.root.join('config', 'feature_flags.yml')
    [:main, *YAML.load_file(feature_flag_path).deep_symbolize_keys[:feature_flags]]
  end
end
