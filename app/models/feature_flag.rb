class FeatureFlag
  include Redis::Objects

  value :flag, expiration: 1.hour

  attr_reader :id

  def initialize
    @id = 'current_flag'
  end

  def save(feature_flag)
    raise ArgumentError("Expected a String, but received a #{feature_flag.class}.") unless feature_flag.is_a?(String)
    return delete if feature_flag == 'main'
    return if flags.exclude?(feature_flag)

    flag.value = feature_flag
  end

  def current_flag
    flag.value
  end

  private

  def delete
    flag.delete
  end

  def flags
    feature_flag_path = Rails.root.join('config', 'feature_flags.yml')
    YAML.load_file(feature_flag_path).deep_symbolize_keys[:feature_flags]
  end
end
