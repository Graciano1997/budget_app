require 'rails_helper'

RSpec.describe 'Index', type: :feature do
  before :each do
    visit root_path
  end

  context 'the Splash screen' do
    it 'Should render Your Budge App content' do
      expect(page).to have_content('Your Budge App')
    end
    it 'Should render the login button' do
      expect(page).to have_button('LOG IN')
    end

    it 'Should render the sign up link' do
      expect(page).to have_link('SIGN UP')
    end
  end
end
