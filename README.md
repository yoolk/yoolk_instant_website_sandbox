Summary
=======

A sandbox rails application that allows you to develop and run your instant website theme locally.

## Installation

Clone this repo

    $ git clone git@github.com:yoolk/yoolk_instant_website_sandbox.git
    $ git init submodule
    $ git submodule update

    $ git pull
    $ git submodule update

It's required you have install ruby and its dependencies correctly. Follow this blog post by [Ryan Bigg](http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/) if you are new to ruby. Basically, this sandbox doesn't require the knowledge of Ruby and Rails.

There is a [sample theme](https://github.com/yoolk/yoolk_instant_website_sandbox/tree/master/app/themes/sample) inside this repo, which you can browse and see the code. You can run this sandbox app by:

    $ rails s

Then, go to your browser [http://localhost:3000](http://localhost:3000).

## Theme Skeleton

**Yoolk Instant Website Theme** is built based on the popular [template engine liquid](https://github.com/Shopify/liquid). It is composed of three things:

  1. Assets: images, javascripts, stylesheets
  2. Views: templates and layouts
  3. Locales: locales files if any

To generate theme inside your app:

    $ rails g instant_website:theme theme_name

<pre>
app/
  themes/
    [theme_name]/
      assets/
        images/
          [theme_name]/
        stylesheets/
          [theme_name]/
            all.scss
        javascripts/
          [theme_name]/
            all.js.coffee
      views/
        layouts/
          [theme_name].html.erb
      locales/
</pre>

You must namespace your assets directory so that it won't conflict with assets in other themes.

```liquid
# In this case, sample is the name of the theme
{{ 'sample/all.css' | asset_url | stylesheet_link_tag }}
{{ 'sample/all.js'  | asset_url | javascript_include_tag }}
```