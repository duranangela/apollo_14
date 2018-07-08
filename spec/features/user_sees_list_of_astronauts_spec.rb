require 'rails_helper'

describe 'astronauts index' do
  it 'user sees a list of astronauts' do
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 36, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age: 34, job: 'Pilot')

    visit '/astronauts'

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content(astronaut_1.age)
    expect(page).to have_content(astronaut_1.job)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content(astronaut_2.age)
    expect(page).to have_content(astronaut_2.job)
  end
  it 'user sees average age of all astronauts' do
    Astronaut.create(name: 'Neil Armstrong', age: 36, job: 'Commander')
    Astronaut.create(name: 'Buzz Aldrin', age: 34, job: 'Pilot')

    visit '/astronauts'

    expect(page).to have_content(Astronaut.average_age)
  end
  it 'user sees list of space missions for each astronaut' do
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 36, job: 'Commander')
    astronaut_1.space_missions.create(title: 'Apollo 13', trip_length: 128)
    astronaut_1.space_missions.create(title: 'Capricorn 4', trip_length: 203)

    visit '/astronauts'

    expect(page).to have_content('Apollo 13')
    expect(page).to have_content('Capricorn 4')
  end
end
