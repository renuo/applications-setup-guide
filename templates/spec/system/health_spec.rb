require 'rails_helper'

RSpec.describe 'Health check' do
  it 'should check if the app is ok and connected to a database' do
    visit '/home/check'
    expect(page).to have_content('1+2=3')
  end
end
