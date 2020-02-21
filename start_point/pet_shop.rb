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
end # PASS

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, pet_name))
end # PASS

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end # PASS
