defmodule HelloWorld do
  @englishHelloPrefix "Hello, "

  def hello_world(name) do
    if name == "",
      do: @englishHelloPrefix <> "World",
      else: @englishHelloPrefix <> name
  end
end

ExUnit.start()

defmodule HelloWorldTest do
  use ExUnit.Case

  import HelloWorld

  test "succes case - saying hello to people" do
    assert hello_world("Alim") == "Hello, Alim"
  end

  test "say 'Hello, World' when an empty string is supplied" do
    assert hello_world("") == "Hello, World"
  end
end
