require 'rails_helper'

RSpec.describe 'Operation', type: :feature do
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

    it 'Should add a NEW CATEGORY back in the home and click on computer and see no operation in that category' do
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
      click_on 'computer'
      expect(page).to have_content 'There is no operations! Please add it!'
    end
  end
end
