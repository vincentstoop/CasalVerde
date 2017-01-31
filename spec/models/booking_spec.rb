require "rails_helper"

RSepc.describe Booking, type: :model do
  it { is_expected.to validate_precence_of(:first_name)}
  it { is_expected.to validate_precence_of(:last_name)}
  it { is_expected.to validate_precence_of(:title)}
  it { is_expected.to validate_precence_of(:email)}
  it { is_expected.to validate_precence_of(:street_name)}
  it { is_expected.to validate_precence_of(:street_number)}
  it { is_expected.to validate_precence_of(:zip_code)}
  it { is_expected.to validate_precence_of(:city)}
end
