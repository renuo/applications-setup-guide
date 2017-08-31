# Bootstrap

`gem 'bootstrap'`

Link to the gem: <https://github.com/twbs/bootstrap-rubygem>

To install the gem, follow the README of the repository.

## Simple Form

### Bootstrap version 4.0.0.beta

If you use the gem [Simple Form](https://github.com/plataformatec/simple_form),
you need to adjust the configuration in the `config/initializers/simple_form.rb` file.

Here are some recommended options:

```ruby
config.wrappers :default, class: 'form-group',
                hint_class: :field_with_hint, error_class: 'has-danger' do |b|
```

```ruby
config.error_notification_class = 'alert alert-danger'
```

```ruby
b.use :error, wrap_with: { tag: :span, class: 'invalid-feedback' }
```

```ruby
config.label_class = 'form-control-label'
```

```ruby
config.input_class = 'form-control'
```

To make the error highlighting work you need to add some css to your application

```scss
.invalid-feedback {
  display: block;
}

.has-danger {
  .form-control {
    border-color: $form-feedback-invalid-color;
  }
}
```

For the styling of the pull down date selectors or checkboxes, you need to write some wrappers, that you can add
to the input element.
It is best to create a separate config file for this.

```ruby
# config/initializers/simple_form_bootstrap.rb

SimpleForm.setup do |config|
  config.wrappers :inline_date, tag: 'div', error_class: 'has-danger' do |b|
    b.use :html5
    b.use :label, class: 'control-label'
    b.wrapper tag: 'div', class: 'form-inline row' do |ba|
      ba.use :input, class: 'form-control form-inline', wrap_with: { class: 'col-md-6' }
      ba.use :error, wrap_with: { tag: 'span', class: 'invalid-feedback' }
      ba.use :hint, wrap_with:  { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :inline_checkbox, tag: 'div', class: 'control-group', error_class: 'has-error' do |b|
    b.use :html5
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :label_input, wrap_with: { class: 'checkbox inline' }
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint, wrap_with: { tag: 'p', class: 'help-block' }
    end
  end
end

```

Then you can add one to the input element:

```ruby
f.input :check, wrapper: :inline_checkbox
```
