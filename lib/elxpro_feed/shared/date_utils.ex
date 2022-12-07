defmodule ElxproFeed.Shared.DateUtils do
  def format_date(date) do
    "#{date.day} of #{date.year} at #{date.hour}:#{date.minute}h"
  end

  def published_at(date) do
    cond do
      Timex.diff(NaiveDateTime.utc_now(), date, :hour) <= 24 ->
        convert_to_number(date, :hours)

      Timex.diff(NaiveDateTime.utc_now(), date, :day) <= 30 ->
        convert_to_number(date, :days)

      Timex.diff(NaiveDateTime.utc_now(), date, :month) <= 12 ->
        convert_to_number(date, :months)

      true ->
        convert_to_number(date, :year)
    end
  end

  defp convert_to_number(date, type) do
    NaiveDateTime.utc_now()
    |> Timex.diff(date, type)
    |> then(&(Integer.to_string(&1) <> " " <> Atom.to_string(type)))
  end
end
