# Overview

## 2015-06-16

* Rename `#url` on `menu/category` object to `#foods_url`.
* Product has many categories, and they are optional.
* Food has one category, it is optional.
* Add `within` filter. Creates a collection-aware product/food URL by prepending "/product-categories/collection-handle/" or "/menu-categories/collection-handle" to a product/food URL, where "collection-handle" is the handle, eg: 19-electronics, of the collection that is currently being viewed.
* Add `{{ content_for_closing_body }}` to render `google_remarketing_tag` and `google_conversion_tag`.


Input:
  ``<a href="{{ product.url | within: product_category }}">{{ product.name }}</a>``

Output:
  ``<a href="/product-categories/19-electronics/products/1-microwave">Microwave</a>``


## 2015-05-22

* Add `google_remarketing_tag`.
* Add `#home_page`, `#products_page`, `#services_page`, `#menu_page`, `#galleries_page`,
      `#about_us_page`, `#contact_us_page`, `#reservation_page`, `#feedback_page`,
      `#announcements_page`, `#videos_page`, `#attachments_page`, `#links_page`,
      `#people_page`, `#map_page`, `#brochures_page` to `#instant_website`.

## 2015-05-05

* Fix sample images
* Show favicon and webclip inside `content_for_header`
* Bump to rails `4.1.x`
* Render google analytics script for listing owner
* Theme generator: with locales and pages

## 2015-04-02

* Add `pages` to `instant_website` object.
* Add `data-theme-name` and `data-listing-alias-id` to body tag inside theme generator.
* Translates with default from global namespace.

## 2015-03-20

* Add `assets-rails` gem as submodule so that it's easy to browse and include vendor assets
* Add `money` and `money_with_currency` as filter.
* Add `price` to `product`, `service`, and `food`.
* Validate `{{ content_for_layout }}` and `{{ content_for_header }}` inside theme's layout file.
* Rename `theme_style_url` to `theme_color_url`.
* Add `links`, `attachments`, `videos` page.
* Use universal google analytics script.
* Add `#query_parameters` to `request` object.
* Update `sass-rails` gem.
* Implement default photo inside `PersonDrop`.
* Add `auto_link` filter.
* Add `truncate_html` filter.

## 2014-12-12

* Organize Javascript code with `Rails with no JS framework`, https://medium.com/@cblavier/rails-with-no-js-framework-26d2d1646cd
* Add `js_class_name` to `request` object
* Add `theme.js`, `namespace.js`, and `application_view.js`

## 2014-12-04

* Add `breadcrumb` tag
* Add `business_hour` object

## 2014-11-21

* Fix scope on: `catalog_items`, `medias`, and `artworks`
* Fix `#multilinguals` to return only listings with instant website
* Add `draft_stamp` tag to the layout generator

## 2014-11-14

* Add rake script to validate theme. Validation includes:
  * asset precompilation
  * locales
  * liquid syntax
* Add more methods to `request` object:
  * `#root_url?`
  * home_url?
  * galleries_url?
  * people_url?
  * brochures_url?
  * map_url?
  * products_url?
  * services_url?
  * menu_url?
  * announcements_url?
  * about_us_url?
  * contact_us_url?
  * reservation_url?
  * feedback_url?
* Add rel='nofollow' to `#link_to_office` and `link_to_sign_in`
* Add `#short_description` object
* Implement multiple styles in a theme
  * Add `theme_name` and `theme_style_url` to `request`

## 2014-10-31

* Add `#preview_mode?` and `#host` to `request` object
* Display `cover_photos` of the current template during preview
* Add `#multilinguals` to `listing` object

## 2014-10-24

* Integrate with `assets-rails`
* Add `google_static_map` filter

## 2014-10-17

* Add more meta tags to `{{ content_for_header }}`
* Add `#current?` to `food/category`, `product/category`, and `service/category`

## 2014-10-10

* Add `draft_stamp` tag

## 2014-10-03

* Fix theme generator
* Add `form` tag for: contact, feedback, reservation

## 2014-09-26

* Add `#twitter_url` and `#facebook_page_url` to listing
* Integrate with the main app
* Add `{{ content_for_header }}` to theme layout

....
