defmodule Knn.Distance do
    @moduledoc """
    This module contains some distance functions
    """
    def euclidean(a_list, b_list) do
      Enum.zip(a_list, b_list)
      |> Enum.map(fn { a, b } -> :math.pow(a-b, 2) end)
      |> Enum.sum
      |> :math.sqrt
    end
  end
  