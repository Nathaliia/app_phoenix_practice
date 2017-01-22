defmodule AppPhoenixPractice.Contact do
  use AppPhoenixPractice.Web, :model

  schema "contacts" do
    field :name, :string
    field :email, :string
    field :phone, :string
    field :address, :string
    field :city, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :phone, :address, :city])
    |> validate_required([:name, :email, :phone, :address, :city])
  end
end
