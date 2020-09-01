defmodule HelloWorld do
  def hello_world(name, language) do
    language_selection(language, name)
  end

  def hello_world(name) do
    "Hello, " <> name
  end

  def hello_world() do
    "Hello, " <> "World"
  end

  defp language_selection("Spanish", name) do
    "Hola, " <> name
  end

  defp language_selection("French", name) do
    "Bonjour, " <> name
  end
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule HelloWorldTest do
      use ExUnit.Case

      import HelloWorld

      defp correct_message(got, want) do
        want == got
      end

      test "succes case - saying hello to people" do
        want = hello_world("Bob")
        got = "Hello, Bob"

        assert correct_message(got, want) == true
      end

      test "say 'Hello, World' when an empty string is supplied" do
        got = hello_world()
        want = "Hello, World"

        assert correct_message(got, want) == true
      end

      test "in Spanish" do
        got = hello_world("Bob", "Spanish")
        want = "Hola, Bob"

        assert correct_message(got, want) == true
      end

      test "in French" do
        got = hello_world("Bob", "French")
        want = "Bonjour, Bob"

        assert correct_message(got, want) == true
      end
    end

  _ ->
    IO.puts("Supply your command with --test flag")
end
