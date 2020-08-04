defmodule HelloWorld do
  def hello_world(name) do
    "Hello, #{name}"
  end
end

ExUnit.start()

defmodule HelloWorldTest do
  use ExUnit.Case

  import HelloWorld

  test "hello world succes case" do
    assert hello_world("Alim") == "Hello, Alim"
  end
end
