require 'rails_helper'
require 'pry'

describe Product do
  it { should have_many(:reviews) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cost) }
  it { should validate_presence_of(:country_of_origin) }


end
