
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows a user to add a doctor') do
    visit('/administrator')
    fill_in('docName', :with => 'Frank Miller')
    # fill_in('specialty', :with => 'GP')
    find(:select).find(:option, 'GP').select_option
    click_button('Add Doctor')
    expect(page).to have_content('Frank Miller')
    expect(page).to have_content('GP')

    visit('/administrator')
    fill_in('patientName', :with => 'Stan Lee')
    fill_in('birthdate', :with => '1963-02-14')
    fill_in('doctor_name', :with => 'Frank Miller')
    click_button('Add Patient')
    expect(page).to have_content('Stan Lee')
    expect(page).to have_content('Frank Miller')

    visit('/doctor')
    fill_in('docName', :with => 'Frank Miller')
    click_button('See Patients')
    expect(page).to have_content('Stan Lee')
  end
end

# describe('adding a new patient', {:type => :feature}) do
#   it('allows a user to add a patient') do
#
#   end
# end

# describe('display doctor\'s patients', {:type => :feature}) do
#   it('allows a doctor to view their patients') do
#
#   end
# end
