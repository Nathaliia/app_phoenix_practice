defmodule AppPhoenixPractice.Repo.Migrations.CreateContact do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :address, :string
      add :city, :string

      timestamps()
    end

  end
end
