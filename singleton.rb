# Single class that responsible to create an object
# Ensure that class has only one instance
# Provive global access to that instance

# Could be accomplished with built-in 'Singleton' module
require 'yaml'

class ApplicationSettings

  def initialize
    @path = File.join(__dir__, 'settings.yml')
  end

  def add(key, value)
    file =  File.exists?(@path) ? File.open(@path, 'r+') : File.open(@path, 'w+')
    yml_data = data
    yml_data[key.to_sym] = value
    file.write(yml_data.to_yaml)
    file.close
  end

  def data
    if File.exists?(@path)
       YAML::load_file(@path) || {}
    else
      {}
    end
  end

  @@instance = ApplicationSettings.new

  def self.instance
    return @@instance
  end

  private_class_method :new
end

settings = ApplicationSettings.instance

settings.add('language', 'ua')
settings.add('timezone', 'Europe/Kyiv')

puts settings.data[:language]
puts settings.data[:timezone]
