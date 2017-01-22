defmodule AppPhoenixPractice.ContactController do
  use AppPhoenixPractice.Web, :controller

  alias AppPhoenixPractice.Contact

  def index(conn, _params) do
  	contacts = Repo.all(Contact)
    render(conn, "index.html",contacts: contacts)
  end

  def new(conn, _params) do
  	changeset = Contact.changeset(%Contact{})
  	render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"contact" => contact_params }) do
  	changeset = Contact.changeset(%Contact{}, contact_params)

  	case Repo.insert(changeset) do
  		{:ok, _user} ->
  			conn
  			|> put_flash(:info, 'Contact created successfully')
  			|> redirect(to: contact_path(conn, :index))
  		{:error, changeset} ->
  			render(conn, "new.html", changeset: changeset)
  	end
  end

  def edit(conn, %{"id" => id}) do
  	contact = Repo.get!(Contact, id)
  	changeset = Contact.changeset(contact)

  	render(conn, "edit.html", contact: contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "contact" => contact_params}) do 
  	contact = Repo.get!(Contact, id)
  	changeset = Contact.changeset(contact, contact_params)

  	case Repo.update(changeset) do
  		{:ok, _user} ->
  			conn
  			|> put_flash(:info, 'Contact updated successfully')
  			|> redirect(to: contact_path(conn, :index))
  		{:error, changeset} ->
  			render(conn, "edit.html", contact: contact ,changeset: changeset)
  	end
  end

  def delete(conn, %{"id" => id}) do
  	contact = Repo.get!(Contact, id)
  	Repo.delete!(contact)

  	conn
  	|> put_flash(:info, "User deleted successfully")
  	|> redirect(to: contact_path(conn, :index))
  end
end
