require('pry-byebug')

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end # PASS

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end # PASS

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end # PASS

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end # PASS

def increase_pets_sold(pet_shop, number)
  pet_shop[:admin][:pets_sold] += number
end # PASS

def stock_count(pet_shop)
  return pet_shop[:pets].length
end # PASS

# v REFACTOR v

def pets_by_breed(pet_shop, breed)
  pets_of_breed = []
  pet_shop[:pets].each do |pet|
    if pet[:breed] == breed
      pets_of_breed.push(pet[:name])
    end
  end
return pets_of_breed
end # PASS

# ^ REFACTOR ^

def find_pet_by_name(pet_shop, pet_name)
  return pet_shop[:pets].find { |pet| pet[:name] == pet_name }
end # PASS returns hash of pet from pets array

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, pet_name))
end # PASS

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end # PASS

def customer_cash(customer)
  return customer[:cash]
end # PASS

def remove_customer_cash(customer, deduction)
  customer[:cash] -= deduction
end # PASS

def customer_pet_count(customer)
  return customer[:pets].length
end # PASS

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end # PASS

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] >= new_pet[:price] ? true : false
end # PASS

def sell_pet_to_customer(pet_shop, pet, customer)
  if (customer_cash(customer) >= pet[:price]) && (pet != nil)
    add_pet_to_customer(customer, pet) # adds pet to customer pet list
    remove_pet_by_name(pet_shop, pet[:name]) # removes pet from pet_shop inventory
    pet_shop[:admin][:pets_sold] += 1 # increments pet_shop pets_sold by 1

    customer[:cash] -= pet[:price]
    add_or_remove_cash(pet_shop, pet[:price])
  end # PASSES for pet_found
end
