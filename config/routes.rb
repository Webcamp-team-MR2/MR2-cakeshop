Rails.application.routes.draw do

  namespace :admin do
    get 'searchwindow/index'
    get 'searchwindow/search'
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  scope module: :customer do
    resources :addresses, except:[:new,:show]
  end

  scope module: :customer do
    resources :cart_items, except:[:show,:new]
    get 'cart_items/confirm'
  end

  scope module: :customer do
    resources :cart_items, except:[:show,:new]
    delete 'cart_items', to: 'cart_items#all_destroy'
  end

  scope module: :customer do
    resources :orders, only:[:show,:index,:create]
    get 'orders/thanks'
  end

  scope module: :customer do
    resources :items, only:[:show]
  end

  scope module: :customer do
    get 'customers/with_draw' => "customers#with_draw"
    resources :customers, only:[:show,:edit,:update,:destroy]
  end

  scope module: :home do
    root 'homes#top'
    get 'homes/about'
  end

  namespace :admin do
    resources :orders, except:[:new,:show,:create,:destroy] do
      
      patch 'item_update/:order_item_id' => 'orders#item_update', as: 'update'
    end
  end

  namespace :admin do
    resources :items
  end

  namespace :admin do
    resources :customers, only:[:index,:show,:edit,:update]
    get 'customer/top' => "customers#top"
  end

  namespace :admin do
    resources :categories
  end

  namespace :admin do
  get "searches/" => "searchwindows#index"
  post "searches/" => "searchwindows#search", as: "search"
  end
end