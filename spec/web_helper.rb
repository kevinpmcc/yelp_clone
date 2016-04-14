def sign_up_correctly
  visit '/restaurants'
  click_link 'Sign up'
  fill_in 'Email', with: 'qt_pie@gmail.com'
  fill_in 'Password', with: 'password12345678'
  fill_in 'Password confirmation', with: 'password12345678'
  click_button 'Sign up'
end
