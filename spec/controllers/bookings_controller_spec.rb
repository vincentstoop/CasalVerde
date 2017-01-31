require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  it { should route(:get, '/bookings').to(action: :index) }
  
end
