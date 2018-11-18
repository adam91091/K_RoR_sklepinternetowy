require 'rails_helper'

RSpec.describe Productrate do
  it 'should belongs to product' do
    t = Productrate.reflect_on_association(:product)
    expect(t.macro).to eq(:belongs_to)
  end
end
