require 'rails_helper'

feature 'View instagram images', js: true do
  scenario 'visit photogallery' do
    visit pages_photogallery_path
    expect(page).to have_css '.ig-image'
  end
end
