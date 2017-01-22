defmodule AppPhoenixPractice.Router do
  use AppPhoenixPractice.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppPhoenixPractice do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get   "/contact", ContactController, :index
    get   "/contact/:id/edit", ContactController, :edit
    get   "/contact/new", ContactController, :new
    post  "/contact", ContactController, :create
    put   "/contact/:id", ContactController, :update
    delete "/contact/:id", ContactController, :delete


  end

  # Other scopes may use custom stacks.
  # scope "/api", AppPhoenixPractice do
  #   pipe_through :api
  # end
end
