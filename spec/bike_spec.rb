require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe Bike do
  it { is_expected.to respond_to(:working?) }
end
