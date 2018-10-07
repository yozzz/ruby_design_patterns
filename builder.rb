# From GoF
# Separate the construction of a complex object from its representation so that
# the same construction process can create different representations.

class Seller

  attr_accessor :name, :website, :bank_account, :city, :country, :description

end

class BankAccount

  attr_accessor :bank_account_num

  def initialize(bank_account_num)
    @bank_account_num = bank_account_num
  end

  # some bank account logic here...

end

class SellerBuilder

  def self.build
    builder = new
    yield(builder)
    builder.seller
  end

  def seller
    @seller ||= Seller.new
  end

  def name(name)
    presence_attr?(name)
    seller.name = name
  end

  def website(website)
    presence_attr?(website)
    seller.website = website
  end

  def bank_account(bank_account_num)
    presence_attr?(bank_account_num)
    seller.bank_account = BankAccount.new(bank_account_num)
  end

  def location(location = {})
    seller.country = location[:country]
    seller.city = location[:city]
  end

  def description(description)
    seller.description = description
  end

  private

  def presence_attr?(attr)
    raise "Seller attribute #{attr} is required" if attr.to_s.empty?
  end

end

seller = SellerBuilder.build do |seller|
  seller.name("Leo Shop")
  seller.website("leoshoplviv.com")
  seller.bank_account("51684899987031")
  seller.location({country: 'Ukraine', city: 'Lviv'})
  seller.description('Suvenire shop')
end

p seller
puts seller.name
puts seller.website
puts seller.bank_account.bank_account_num
puts seller.country
puts seller.description
