defmodule HelloWorld do
  @englishHelloPrefix "Hello, "

  @spanish "Spanish"
  @spanishHelloPrefix "Hola, "

  @french "French"
  @frenchHelloPrefix "Bonjour, "

  def hello_world(name \\ "", language \\ "") do
    if name == "" && language == "",
      do: @englishHelloPrefix <> "World",
      else: language_selection(language, name)
  end

  defp language_selection(language, name) do
    case language do
      "" -> @englishHelloPrefix <> name
      @spanish -> @spanishHelloPrefix <> name
      @french -> @frenchHelloPrefix <> name

    end
  end
end

ExUnit.start()

defmodule HelloWorldTest do
  use ExUnit.Case

  import HelloWorld

  defp assert_correct_message(got, want) do
    assert want == got
  end

  test "succes case - saying hello to people" do
    want = hello_world("Bob")
    got = "Hello, Bob"

    assert_correct_message(got, want)
  end

  test "say 'Hello, World' when an empty string is supplied" do
    got = hello_world()
    want = "Hello, World"

    assert_correct_message(got, want)
  end

  test "in Spanish" do
    got = hello_world("Bob", "Spanish")
    want = "Hola, Bob"
    assert_correct_message(got, want)
  end

  test "in French" do
    got = hello_world("Bob", "French")
    want = "Bonjour, Bob"
    assert_correct_message(got, want)
  end
end
