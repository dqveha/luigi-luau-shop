require 'rails_helper'
require 'pry'

describe Review do
  it { should belong_to(:product) }
end
