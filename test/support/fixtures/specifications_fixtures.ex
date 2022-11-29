defmodule ElxproFeed.SpecificationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElxproFeed.Specifications` context.
  """

  @doc """
  Generate a specification.
  """
  def specification_fixture(attrs \\ %{}) do
    {:ok, specification} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ElxproFeed.Specifications.create_specification()

    specification
  end
end
