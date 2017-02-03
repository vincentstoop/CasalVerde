require 'rails_helper'

feature 'Enter form for booking', js: true do
  scenario 'visit new bookings page' do
    visit new_booking_path
    fill_in 'booking_check_in', with: '2017-02-06'
    fill_in 'booking_check_out', with: '2017-02-09'
    fill_in 'booking_first_name', with: 'Wouter'
    fill_in 'booking_title', with: 'Mr.'
    fill_in 'booking_phone', with: '1234567890'
    fill_in 'booking_email', with: 'wouter@codaisseur.com'
    fill_in 'booking_street_name', with: 'Singel'
    fill_in 'booking_street_number', with: '542'
    fill_in 'booking_city', with: 'Amsterdam'
    fill_in 'booking_zip_code', with: '1017 AZ'
    fill_in 'booking_people', with: 8
    page.execute_script("$('#new_booking').submit()")
    expect(page.current_path).to eq some_other_page_path
  end
end
