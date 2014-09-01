YoolkInstantWebsiteSandbox::Application.routes.draw do

  root "home#index"
  get  "send_mail"          => "contact_us#send_mail"
  get  "send_feedback"      => "feedback#send_feedback"
  get  "send_reservation"   => "reservation#send_reservation"
  get  "send_mail"          => "mailer#send_email"
  post "contact"            => "home#contact"

  resources :about_us,      :only => [:index]
  resources :contact_us,    :only => [:index,:create]
  resources :galleries,     :only => [:index,:show]
  resources :people,        :only => [:index]
  resources :reservation,   :only => [:index]
  resources :feedback,      :only => [:index]
  resources :announcements, :only => [:index, :show]
  resources :map,           :only => [:index]
  resources :brochures,     :only => [:index]

  resources :reservation,   :only => [:index, :create]
  resources :feedback,      :only => [:index, :create]

  get "menu",                       to: "menu#index",                 as: :menu_index
  get "menu/:category_id/:id",      to: "menu/foods#show",            as: :menu_food
  get "menu/:category_id",          to: "menu/categories#show",       as: :menu_category

  get "services",                   to: "services#index",             as: :services
  get "services/:category_id/:id",  to: "services#show",              as: :service
  get "services/:category_id",      to: "services/categories#show",   as: :services_category

  get "products",                   to: "products#index",             as: :products
  get "products/:category_id/:id",  to: "products#show",              as: :product
  get "products/:category_id",      to: "products/categories#show",   as: :products_category

  get "robots.txt" => "home#robots"
end