defmodule Knn do
  @moduledoc """
  This module is simple K-Nearest neighbours algorithm
  """

  @doc """
  Base function for computing KNN approximation
  """
  def predict(distance_function, input, dataset, k) do
    sort(distance_function, input, dataset)
    |> limit(k)
    |> map_labels
    |> most_frequent
    |> elem(0)
  end

  defp map_labels(dataset) do
    Enum.map(dataset, fn(example) -> Map.get(example, :label) end)
  end

  defp limit(dataset, limit) do
    Enum.take(dataset, limit)
  end

  defp most_frequent(dataset) do
    dataset
    |> Enum.reduce(%{}, &accumulate_count/2)
    |> Enum.max_by(&(elem(&1, 1)))
  end  
  
  defp accumulate_count(label, acc) do
    Map.update(acc, label, 1, &(&1 + 1))
  end

  defp sort(distance_function, input, dataset) do
    Enum.sort_by(dataset, &(distance_function.(input, &1.features)))
  end
end
