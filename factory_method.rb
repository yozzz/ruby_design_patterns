# Idea is to define factory method which will detect specific type of object
# Client will be able to create objects through common interface without having to specify exact class of the object

class DeliverOrderByAirplane
  
  def call
    puts 'Deliver order by plane'
  end

end

class ShippingOrderBySea
  
  def call
    puts 'Shipping by sea'
  end

end

class DeliverOrderByDron

  def call
    puts 'Deliver order by dron'
  end

end

class Deliver

  def self.by(type)
    case type
    when 'Airplane' then DeliverOrderByAirplane.new
    when 'Sea' then ShippingOrderBySea.new
    when 'Dron' then DeliverOrderByDron.new
    end
  end

end


Deliver.by('Airplane').call
Deliver.by('Sea').call
Deliver.by('Dron').call
