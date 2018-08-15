# Wicked PDF

Can be used to generate PDFs and supports HTML to PDF.

:warning: Up to now, Wicked PDF does not support Bootstrap 4, so if you want to use Bootstrap 4 Templates, use another library :warning:

* Add `gem 'wicked_pdf'` to the main section of `Gemfile`
* Add `gem 'wkhtmltopdf-binary'` to `group :development, :test`
* Add `gem 'wkhtmltopdf-heroku'` to `group :production`

By default, it adds no layout, you you may want to add a layout:

* Create a `pdf.pdf.slim`
* Use the method to add stylesheets : `wicked_pdf_stylesheet_link_tag 'pdf', media: 'all'`
* Use the method `wicked_pdf_image_tag` to insert images to the layout.

*Usage:* 

```rb
render pdf: <<filename>>, print_media_type: true, layout: 'pdf', disposition: 'attachment'
```

:warning: Consider using a job-runner to not block the server during creation of PDFs.
