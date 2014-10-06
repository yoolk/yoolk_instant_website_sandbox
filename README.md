[![Build Status](https://travis-ci.org/yoolk/yoolk_liquid.svg?branch=master)](https://travis-ci.org/yoolk/yoolk_liquid) [![Coverage Status](https://coveralls.io/repos/yoolk/yoolk_liquid/badge.png?branch=master)](https://coveralls.io/r/yoolk/yoolk_liquid?branch=master)
Summary
=======

A sandbox rails application that allows you to develop and run your instant website theme locally.

## Installation

For the first time, clone this repo

    $ git clone git@github.com:yoolk/yoolk_instant_website_sandbox.git
    $ git submodule init
    $ git submodule update

Later,

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

    [http://localhost:3000/?theme=sample](http://localhost:3000/?login=developer@yoolk.com)

2. To switch locale, pass `locale` param. By default, it will pick up from current listing's locale.

    [http://localhost:3000/?locale=km](http://localhost:3000/?login=developer@yoolk.com)

3. To switch listing, pass `alias_id` param. By default, it will pick up [kh1.json](https://github.com/yoolk/yoolk_instant_website_sandbox/blob/master/db/samples/jsons/kh1.json). You can create more listings on your development machine if you like. Just follow the sample schema.

    [http://localhost:3000/?alias_id=kh1](http://localhost:3000/?login=developer@yoolk.com)

4. To switch account, pass `login` param. Have a look on [developer@yoolk.com.json](https://github.com/yoolk/yoolk_instant_website_sandbox/blob/master/db/samples/jsons/developer@yoolk.com.json).

    [http://localhost:3000/?login=developer@yoolk.com](http://localhost:3000/?login=developer@yoolk.com)

## Theme Skeleton

**Yoolk Instant Website Theme** is built based on the popular [template engine liquid](https://github.com/Shopify/liquid). Check out the [theme documentation](http://yoolk.github.io/liquid-documentation/) for details. It is composed of three things:

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
        about_us/
          index.liquid
        announcements/
          index.liquid
          show.liquid
        brochures/
          index.liquid
        galleries/
          index.liquid
          show.liquid
        home/
          index.liquid
        map/
          index.liquid
        menu/
          categories/
            show.liquid
          foods/
            show.liquid
          index.liquid
        products/
          categories/
            show.liquid
          index.liquid
          show.liquid
        services/
          categories/
            show.liquid
          index.liquid
          show.liquid
        layouts/
          [theme_name].liquid
        reservation/
          index.liquid
        feedback
          index.liquid
      locales/
</pre>

You must namespace your assets directory so that it won't conflict with assets in other themes.

```liquid
# In this case, sample is the name of the theme
{{ 'sample/all.css' | asset_url | stylesheet_link_tag }}
{{ 'sample/all.js'  | asset_url | javascript_include_tag }}
```

### Manifest files
There are two manifest files: `all.js.coffee` and `all.scss`. It contains *Sprockets directives* - instructions that tell which files to require in order to build a single CSS or JavaScript file for that theme. With these directives, Sprockets loads the files specified, processes them if necessary, concatenates them into one single file and then compresses them. By serving one file rather than many, the load time of pages can be greatly reduced because the browser makes fewer requests. Compression also reduces file size, enabling the browser to download them faster.

Here is the default `all.js.coffee` file which contains the following lines:
<pre>
// ...
//= require jquery
//= require jquery_ujs
//= require_tree .
</pre>

In JavaScript files, Sprockets directives begin with //=. In the above case, the file is using the `require` and the `require_tree` directives. The require directive is used to tell Sprockets the files you wish to `require`. Here, you are requiring the files `jquery.js` and `jquery_ujs.js` that are available somewhere in the search path for Sprockets. You need not supply the extensions explicitly. Sprockets assumes you are requiring a .js file when done from within a .js file.

The `require_tree` directive tells Sprockets to recursively include all JavaScript files in the specified directory into the output. These paths must be specified relative to the manifest file. You can also use the `require_directory` directive which includes all JavaScript files only in the directory specified, without recursion.

Directives are processed top to bottom, but the order in which files are included by require_tree is unspecified. You should not rely on any particular order among those. If you need to ensure some particular JavaScript ends up above some other in the concatenated file, require the prerequisite file first in the manifest. Note that the family of `require` directives prevents files from being included twice in the output.

Here is the default `all.scss` file which contains the following lines:
<pre>
/* ...
*= require_self
*= require_tree .
*/
</pre>

The directives that work in JavaScript files also work in stylesheets (though obviously including stylesheets rather than JavaScript files). The `require_tree` directive in a CSS manifest works the same way as the JavaScript one, requiring all stylesheets from the current directory.

In this example, `require_self` is used. This puts the CSS contained within the file (if any) at the precise location of the `require_self` call. If `require_self` is called more than once, only the last call is respected.

If you want to use multiple Sass files, you should generally use the `Sass @import rule` instead of these `Sprockets directives`. Using Sprockets directives all Sass files exist within their own scope, making variables or mixins only available within the document they were defined in.

You can have as many manifest files as you need. For example, the `admin.css` and `admin.js` manifest could contain the JS and CSS files that are used for the admin section of an application.

The same remarks about ordering made above apply. In particular, you can specify individual files and they are compiled in the order specified. For example, you might concatenate three CSS files together this way:

<pre>
/* ...
*= require reset
*= require layout
*= require chrome
*/
</pre>