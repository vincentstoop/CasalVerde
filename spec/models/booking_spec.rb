require "rails_helper"

RSpec.describe Booking, type: :model do
  it { is_expected.to validate_presence_of(:check_in)}
  it { is_expected.to validate_presence_of(:check_out)}
  it { is_expected.to validate_presence_of(:first_name)}
  it { is_expected.to validate_presence_of(:last_name)}
  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to validate_presence_of(:phone)}
  it { is_expected.to validate_presence_of(:email)}
  it { is_expected.to validate_presence_of(:street_name)}
  it { is_expected.to validate_presence_of(:street_number)}
  it { is_expected.to validate_presence_of(:zip_code)}
  it { is_expected.to validate_presence_of(:city)}
  it { is_expected.to validate_presence_of(:people)}
  it { is_expected.to validate_presence_of(:paid)}
  it { is_expected.to validate_presence_of(:total_price)}
end
