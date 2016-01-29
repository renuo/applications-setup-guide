# One Simple Test

Run

```
rspec
```

It should be green.

## spec/requests/home_spec.rb

```
require 'rails_helper'

RSpec.describe 'Home', type: :request do
  context 'initial test' do
    it 'should check if the app is ok and connected to a database' do
      get '/home/check'
      expect(response).to have_http_status(200)
      expect(response.body).to eq('1+2=3')
    end
  end
end
```

Run

```
bin/check
```

It should be red (because of rspec).

```
rails g controller home index check
rm app/views/home/check.html.erb
rm -rf test
rm app/assets/javascripts/home.coffee
rm app/assets/stylesheets/home.scss
```

```
# config/routes.rb
get 'home/check'

# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
  end

  def check
    val = ActiveRecord::Base.connection.execute('select 1+2 as val').first['val']
    render text: "1+2=#{val}"
  end
end
```

Run

```
bin/check
```

It should be green.
