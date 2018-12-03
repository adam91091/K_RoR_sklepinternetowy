require 'rails_helper'

RSpec.describe ApplicationController do
  describe '#current_guest' do
    it do
      expect(subject.current_guest).to be_a(Guest)
    end
  end
end
