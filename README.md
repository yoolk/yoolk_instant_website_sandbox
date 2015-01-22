[![Build Status](https://travis-ci.org/yoolk/yoolk_liquid.svg?branch=master)](https://travis-ci.org/yoolk/yoolk_liquid) [![Coverage Status](https://coveralls.io/repos/yoolk/yoolk_liquid/badge.png?branch=master)](https://coveralls.io/r/yoolk/yoolk_liquid?branch=master)
Summary
=======

A sandbox rails application that allows you to develop and run your instant website theme locally. It was originally developed by [Chamnap Chhorn](http://github.com/chamnap), and it is currently maintained by him.

## Installation

For the first time, clone this repo

    $ git clone git@github.com:yoolk/yoolk_instant_website_sandbox.git
    $ git submodule init
    $ git submodule update

Because this repo is new and young, please keep your local repo up to date with new features by the following commands,

    $ git pull
    $ git submodule update

It's required you have install ruby and its dependencies correctly. Follow this blog post by [Ryan Bigg](http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/) if you are new to ruby. Basically, this sandbox doesn't require the knowledge of Ruby and Rails.

There is a [sample theme](https://github.com/yoolk/yoolk_instant_website_sandbox/tree/master/app/themes/sample) inside this repo, which you can browse and see the code.

Then, use Bundler to install the gem and its dependencies:

    $ bundle install

Copy the sample attachment files into the sandbox

    $ rake instant_website:attachments:copy

You can run this sandbox app by:

    $ rails s

Then, go to your browser [http://localhost:3000](http://localhost:3000).

## Sandbox Usage

1. To switch theme, pass `theme` param. By default, it will pick up the theme from `listing.instant_website.template_name`. In this sandbox app, it will choose `sample` theme otherwise.

    [http://localhost:3000/?theme=sample](http://localhost:3000/?theme=sample)

2. To switch style, pass `style` param. By default, it will pick up the style from 'listing.instant_website.style_name'. In this sandbox app, it could have one of these twos: `blue` or `gray`.

    [http://localhost:3000/?style=gray](http://localhost:3000/?style=gray)

2. To switch locale, pass `locale` param. By default, it will pick up from current listing's locale.

    [http://localhost:3000/?locale=km](http://localhost:3000/?locale=km)

3. To switch listing, pass `alias_id` param. By default, it will pick up from the [localhost.json](https://github.com/yoolk/yoolk_instant_website_sandbox/blob/master/db/samples/jsons/domains/localhost.json). You can create more listings on your development machine if you like. Just follow the sample schema.

    [http://localhost:3000/?alias_id=kh1](http://localhost:3000/?alias_id=kh1)

4. To switch account, pass `login` param. Have a look on [developer@yoolk.com.json](https://github.com/yoolk/yoolk_instant_website_sandbox/blob/master/db/samples/jsons/developer@yoolk.com.json).

    [http://localhost:3000/?login=developer@yoolk.com](http://localhost:3000/?login=developer@yoolk.com)

## Theme Skeleton

**Yoolk Instant Website Theme** is built based on the popular [template engine liquid](https://github.com/Shopify/liquid). Check out the [theme documentation](http://yoolk.github.io/liquid-documentation/theme-templates/) for details. It is composed of three things:

  1. Assets: images, javascripts, stylesheets
  2. Views: templates and layouts
  3. Locales: locales files if any

To generate theme inside your app:

    $ rails g instant_website:theme theme_name
    
To validate your themes:

    $ rake
