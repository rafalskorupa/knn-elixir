defmodule KnnTest do
  use ExUnit.Case
  doctest Knn

  test "with k = 1 get closest example's label" do
    dataset = [
      %Knn.Example{label: :b_label, features: [9, 9]},
      %Knn.Example{label: :a_label, features: [1, 2]},
      %Knn.Example{label: :c_label, features: [3, 3]},
      %Knn.Example{label: :b_label, features: [5, 3]}
    ]

    input = [3, 2]

    assert Knn.predict(&Knn.Distance.euclidean/2, input, dataset, 1) == :c_label
  end

  test "with k = 3 get most frequent element from closes 3 elements" do
    dataset = [
      %Knn.Example{label: :a_label, features: [9, 9]},
      %Knn.Example{label: :b_label, features: [3, 2]},
      %Knn.Example{label: :c_label, features: [3, 3]},
      %Knn.Example{label: :b_label, features: [5, 3]}
    ]

    input = [3, 3]

    assert Knn.predict(&Knn.Distance.euclidean/2, input, dataset, 3) == :b_label
  end
end
