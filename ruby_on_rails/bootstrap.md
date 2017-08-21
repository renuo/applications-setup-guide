# Bootstrap

Link to the gem: <https://github.com/twbs/bootstrap-rubygem>

To install the gem, follow the README of the repository.

## Simple Form

If you use the gem [Simple Form](https://github.com/plataformatec/simple_form),
you need to adjust the configuration in the `config/initializers/simple_form.rb` file.

Here are some recommended options:

```ruby
config.wrappers :default, class: 'form-group',
                hint_class: :field_with_hint, error_class: 'has-danger' do |b|
```

```ruby
b.use :error, wrap_with: { tag: :span, class: 'form-control-feedback' }
```

```ruby
config.label_class = 'form-control-label'
```

```ruby
config.input_class = 'form-control'
```

