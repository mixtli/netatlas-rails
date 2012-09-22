puts "SETTING CONFIG"
CONFIG = HashWithIndifferentAccess.new(YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env])
puts "CONFIG = #{CONFIG.inspect}"

