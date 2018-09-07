require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see all snacks and prices for that vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.00)
    snack_2= dons.snacks.create(name: "chocolate", price: 3.00)

    #don_cheetos= MachineSnack.create(machine: dons, snack:snack_1)

    visit machine_path(dons)

    expect(page).to have_content("Flaming Hot Cheetos")
    expect(page).to have_content(2.00)
    expect(page).to have_content("chocolate")
    expect(page).to have_content(3.00)


  end
  scenario 'sees average price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "Flaming Hot Cheetos", price: 4.00)
    snack_2= dons.snacks.create(name: "chocolate", price: 4.00)
    visit machine_path(dons)

    expect(page).to have_content(4.00)

  end
end
