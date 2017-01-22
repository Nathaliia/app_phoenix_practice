defmodule AppPhoenixPractice.ContactTest do
  use AppPhoenixPractice.ModelCase

  alias AppPhoenixPractice.Contact

  @valid_attrs %{address: "some content", city: "some content", email: "some content", name: "some content", phone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Contact.changeset(%Contact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Contact.changeset(%Contact{}, @invalid_attrs)
    refute changeset.valid?
  end
end
