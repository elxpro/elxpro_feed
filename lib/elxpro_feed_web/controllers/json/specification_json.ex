defmodule ElxproFeedWeb.SpecificationJSON do
  alias ElxproFeed.Specifications.Specification

  @doc """
  Renders a list of specifications.
  """
  def index(%{specifications: specifications}) do
    %{data: for(specification <- specifications, do: data(specification))}
  end

  @doc """
  Renders a single specification.
  """
  def show(%{specification: specification}) do
    %{data: data(specification)}
  end

  defp data(%Specification{} = specification) do
    %{
      id: specification.id,
      name: specification.name
    }
  end
end
