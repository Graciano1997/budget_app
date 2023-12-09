require 'rails_helper'


RSpec.describe 'Group/Category', type: :feature do
  before :each do
    User.create(name: 'gra', email: 'gra@gmail.com', password: 'gragra')
    visit new_user_session_path
    within('.loginContainer') do
      within('.formItem') do
        fill_in 'emai', with: 'gra@gmail.com'
        fill_in 'pass', with: 'gragra'
        click_button 'Log in'
      end
    end
  end

  context 'the Splash screen' do
    it 'Should contain the success sms after log in' do
      expect(page).to have_content 'successfully'
    end

    it 'Should contain the NEW CATEGORY button' do
      expect(page).to have_button 'NEW CATEGORY'
    end

    it 'Should visit the add NEW CATEGORY path, add  and Back at home page and see the added Category' do
      visit new_group_path
      within('.loginContainer') do
        within('.screenBody') do
          within('.formClass') do
            fill_in 'categoryName', with: 'computer'
            fill_in 'categoryIcon', with: '💻'
            click_button 'NEW GROUP'
          end
        end
      end
      expect(page).to have_content 'computer'
    end
  end
end
