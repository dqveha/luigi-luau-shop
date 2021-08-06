require 'rails_helper'
require 'pry'

describe Product do
  it { should have_many(:reviews) }

end
