
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows a user to add a doctor') do
    visit('/administrator')
    fill_in('docName', :with => 'Frank Miller')
    fill_in('specialty', :with => 'GP')
    click_button('Add Doctor')
    expect(page).to have_content('Frank Miller')
    expect(page).to have_content('GP')
  end
end

describe('adding a new patient', {:type => :feature}) do
  it('allows a user to add a patient') do
    visit('/administrator')
    fill_in('patientName', :with => 'Stan Lee')
    fill_in('birthdate', :with => '1963-02-14')
    fill_in('doctor_id', :with => 1)
    click_button('Add Patient')
    expect(page).to have_content('Stan Lee')
    expect(page).to have_content('1963-02-14')
  end
end
