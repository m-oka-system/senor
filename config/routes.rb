Senor::Application.routes.draw do
  get "dashbords/home"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

# ログイン画面をホームにする
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
end
