defmodule KnnDistanceTest do
  use ExUnit.Case
  alias Knn.Distance
  doctest Knn.Distance

  test "#euclidean" do
    assert(Distance.euclidean([0], [-3]) == 3)
    assert(Distance.euclidean([1, 1], [1, 3]) == 2)
    assert(Distance.euclidean([0, 0, 0, 0, 0], [2, 2, 2, 2, 0]) == 4)

    assert_in_delta(
      Distance.euclidean([12.5, -77, 0.01], [42, 12.3, 12]),
      94.8077,
      0.0001
    )
  end

  test "#hamming" do
    assert(Distance.hamming([0, 1], [1, 0]) == 2)
    assert(Distance.hamming([:c, :a, :t], [:c, :o, :t]) == 1)
    assert(Distance.hamming(String.codepoints("cat"), String.codepoints("cot")) == 1)
  end
end
