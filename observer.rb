# Goal communication without coupling
# In one-to-many relationship, one objects(observers) want to be informed
# when other object(In GoF subject - source of the news) changed
# if object need to be informed about the state of the subject it registers as an observer

# Module Subject can be replaced with Ruby built-in module Observable
module Subject
  def initialize
    @observers=[]
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |o|
      o.update
    end
  end
end

class CheckSoldOut
  include Subject

  def call
    notify_observers unless Ticket.any_avaialable?
  end

end

class Ticket

  def self.any_avaialable?
    # let's mock this method
    false
  end

end

class OrganizerSettings

  def initialize(check_sold_out)
    @check_sold_out = check_sold_out
    @check_sold_out.add_observer(self)
  end

  def update
    puts 'E-mail: Tickets for your event have been sold!'
  end

end

class EventReport
  def initialize(check_sold_out)
    @check_sold_out = check_sold_out
    @check_sold_out.add_observer(self)
  end

  def update 
    puts 'Generate sales report...'
  end

end

check_sold_out = CheckSoldOut.new
OrganizerSettings.new(check_sold_out)
EventReport.new(check_sold_out)
check_sold_out.call
    
