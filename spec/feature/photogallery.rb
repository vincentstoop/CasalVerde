require 'rails_helper'

feature 'View instagram images', js: true do
  scenario 'visit photogallery' do
    visit photogallery_pages_path
    expect(page).to have_css '.ig-image'
  end
end
