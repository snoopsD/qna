require 'acceptance_helper'

feature 'Add files to answer', %q{
 In order to illustrate my answer
 As an author answer's
 I'd like to be able attach files  
} do

 given(:user) { create(:user) }
 given(:question) { create(:question, user :user) }

 background do
   sign_in(user)
   visit new_question_path(question)
 end
 
 scenario 'User add files when ask question', js: true do
  fill_in 'Answer', with: 'Test answer'
  attach_file 'File', "#{Rails.root}/spec/spec_helper.rb"
  click_on 'Create'

  within '.answers' do
   expect(page).to have_link 'spec_helper.rb', href: '/uploads/attachment/file/1/spec_helper.rb'
  end 
 end 
end 


