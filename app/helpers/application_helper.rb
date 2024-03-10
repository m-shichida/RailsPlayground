module ApplicationHelper
  def feature_flags
    feature_flag_path = Rails.root.join('config', 'feature_flags.yml')
    flags = YAML.load_file(feature_flag_path).deep_symbolize_keys[:feature_flags].select { |_, v| v }.keys
    [:main, *flags]
  end
end
