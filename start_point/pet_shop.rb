require('pry-byebug')

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end # returns String; name of pet shop

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end # returns Integer; total cash of pet shop

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end # no return value; adds or removes cash from total cash of pet shop

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end # returns Integer; number of pets sold

def increase_pets_sold(pet_shop, number)
  pet_shop[:admin][:pets_sold] += number
end # no return value; adds a number to the number of pets sold

def stock_count(pet_shop)
  return pet_shop[:pets].length
end # returns Integer; number of pets in the pet shop

# v REFACTOR v

def pets_by_breed(pet_shop, breed)
  pets_of_breed = []
  pet_shop[:pets].each do |pet|
    if pet[:breed] == breed
      pets_of_breed.push(pet[:name])
    end
  end
return pets_of_breed
end # returns Array; list of pet names of the same breed

# ^ REFACTOR ^

def find_pet_by_name(pet_shop, pet_name)
  return pet_shop[:pets].find { |pet| pet[:name] == pet_name }
end # returns Hash; Hash of pet which matches the search name

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, pet_name))
end # no return value; removes a pet Hash from the pet shop pets Array

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end # no return value; adds new pet Hash to the pet shop pets Array

def customer_cash(customer)
  return customer[:cash]
end # returns Integer; value of customer cash

def remove_customer_cash(customer, deduction)
  customer[:cash] -= deduction
end # no return value; deducts a value from the customer's cash

def customer_pet_count(customer)
  return customer[:pets].length
end # returns Integer; number of pets a customer has in their pets Array

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end # no return value; adds new pet Hash to customer pets Array

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] >= new_pet[:price] ? true : false
end # returns Boolean; true if customer has enough funds for pet

def sell_pet_to_customer(pet_shop, pet, customer)
  # IF customer can afford the pet AND the pet can be found
  #   add pet to customer's pet inventory
  #   add 1 to the number of pets the shop has sold
  #   deduct the pet price from the customer's funds
  #   add the pet price to the pet shop's funds
  # END
  if !(pet.nil?)
    if customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer, pet)
      increase_pets_sold(pet_shop, 1)
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(pet_shop, pet[:price])
    end
  end
end
