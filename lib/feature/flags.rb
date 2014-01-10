module Feature
  module Flags
    def self.init(config)
      @settings = Hashie::Mash.new(YAML.load_file(config))[Rails.env]
    end

    def self.disable(flag)
      (@settings.key?(flag) && @settings.send("#{flag}=", false))
    end

    def self.enabled?(flag)
      (@settings.key?(flag) && @settings.send(flag))
    end
  end
end