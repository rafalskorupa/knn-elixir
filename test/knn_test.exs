defmodule KnnTest do
  use ExUnit.Case
  alias Knn.Example
  alias Knn.Distance
  doctest Knn

  test "with k = 1 get closest example's label" do
    dataset = [
      %Example{label: :b_label, features: [9, 9]},
      %Example{label: :a_label, features: [1, 2]},
      %Example{label: :c_label, features: [3, 3]},
      %Example{label: :b_label, features: [5, 3]}
    ]

    input = [3, 2]

    assert Knn.predict(&Distance.euclidean/2, input, dataset, 1) == :c_label
  end

  test "with k = 3 get most frequent element from closes 3 elements" do
    dataset = [
      %Example{label: :a_label, features: [9, 9]},
      %Example{label: :b_label, features: [3, 2]},
      %Example{label: :c_label, features: [3, 3]},
      %Example{label: :b_label, features: [5, 3]}
    ]

    input = [3, 3]

    assert Knn.predict(&Distance.euclidean/2, input, dataset, 3) == :b_label
  end
end
