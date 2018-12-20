require 'rails_helper'

feature 'omniauth', type: :feature do

  let(:user) { create(:user) }
  let(:sns_credential) { create(:sns_credential) }


scenario 'register by facebook account' do
    visit root_path
    expect(page).to have_content('新規会員登録')
    visit choice_users_path
    click_link "Facebookで登録"
    expect(page).to have_no_content('新規会員登録')
  end

    scenario 'register by google account' do
    visit root_path
    expect(page).to have_content('新規会員登録')
    visit choice_users_path
    click_link "Googleで登録"
    expect(page).to have_no_content('新規会員登録')
  end

  scenario 'login by facebook account' do
    visit root_path
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    click_link "Facebookでログイン"
    expect(page).to have_no_content('ログイン')
  end

    scenario 'login by google account' do
    visit root_path
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    click_link "Googleでログイン"
    expect(page).to have_no_content('ログイン')
  end

end
