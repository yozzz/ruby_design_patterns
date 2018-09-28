

class Service
  attr_reader :price

  def initialize(description='')
    @description = description
  end

  def price
    0.0
  end
end

class GymService < Service
  def initialize
    super('Large gym with big amount of equipment')
  end

  def price
    1000
  end
end

class PoolService < Service
  def initialize
    super('50 m pool with 10 tracks')
  end

  def price
    800
  end
end

class TowelService < Service
  def initialize
    super('Clean towel before each training')
  end

  def price
    200
  end
end

class MessageService < Service
  def initialize
    super('Professional message, 20 minutes duration')
  end

  def price
    600
  end
end

class PackageService < Service
  def initialize
    super()
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def remove_service(service)
    @services.delete(service)
  end

  def price
    @services.sum(&:price)
  end
end

class ClassicPackageService < PackageService
  def initialize
    super()
    add_service(GymService.new)
    add_service(PoolService.new)
  end
end

class PremiumPackageService < PackageService
  def initialize
    super()
    add_service(GymService.new)
    add_service(PoolService.new)
    add_service(TowelService.new)
    add_service(MessageService.new)
  end
end

puts ClassicPackageService.new.price
puts PremiumPackageService.new.price

