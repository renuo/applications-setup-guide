require 'rails_helper'

RSpec.describe 'Health check' do
  it 'should check if the app is ok and connected to a database' do
    visit '/up'
    expect(page).to have_http_status(200)
  end
end
