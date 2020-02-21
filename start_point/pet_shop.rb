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
