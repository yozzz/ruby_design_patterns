# Single class that responsible to create an object
# Ensure that class has only one instance
# Provive global access to that instance

# Could be accomplished with built-in 'Singleton' module
require 'yaml'

class ApplicationSettings
  attr_reader :settings, :path

  def initialize
    @path = File.join(__dir__, 'settings.yml')
  end

  def add(key, value)
    settings = file_open
    data = {}
    data[key.to_sym] = value
    settings.write(data.to_yaml)
    settings.close
  end

  def data
    YAML::load_file(@path)
  end

  @@instance = ApplicationSettings.new

  def self.instance
    return @@instance
  end

  private

  def file_open
    if File.exists? @path
      File.open(@path, "a+")
    else
      File.open(@path, "w+")
    end
  end

  private_class_method :new
end

settings = ApplicationSettings.instance
puts ApplicationSettings.instance.object_id
puts ApplicationSettings.instance.object_id
settings.add('language', 'ua')
settings.add('timezone', 'Europe/Kyiv')

settings.data[:language]
settings.data[:timezone]
