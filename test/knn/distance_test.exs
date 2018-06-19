defmodule KnnDistanceTest do
  use ExUnit.Case
  doctest Knn.Distance

  test "#euclidean" do
    assert(Knn.Distance.euclidean([0], [-3]) == 3)
    assert(Knn.Distance.euclidean([1, 1], [1, 3]) == 2)
    assert(Knn.Distance.euclidean([0, 0, 0, 0, 0], [2, 2, 2, 2, 0]) == 4)

    assert_in_delta(
      Knn.Distance.euclidean([12.5, -77, 0.01], [42, 12.3, 12]),
      94.8077,
      0.0001
    )
  end
end
