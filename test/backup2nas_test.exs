defmodule Backup2nasTest do
  use ExUnit.Case
  doctest Backup2nas

  describe "finding directories" do

    test "finds directories in order" do
      assert Enum.to_list(Backup2nas.walk_directory("./test/dir")) ==
        [
           "./test/dir/subdir2",
           "./test/dir/subdir1/subsubdir",
           "./test/dir/subdir1",
           "./test/dir",
        ]

    end

  end
end
