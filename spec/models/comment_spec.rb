require 'rails_helper'

RSpec.describe Comment do
  it 'should belong to product' do
    comment = Comment.reflect_on_association(:product)
    expect(comment.macro).to eq(:belongs_to)
  end
end
