# ElixirConcurrency

Demonstration / training over some Elixir concepts for [iWT Health](https://www.iwthealth.com/).

# Tags / Commits / Notes

1. Initial Umbrella Application
  - `mix new repeater --umbrella`
2. New app
   - `mix new repeater`
   - Show basic testing
      - assert
      - file_name_test.exs
3. Basic Documentation
   - parameters
   - doc tests
      - Demonstrate basic doc test failure
4. Immutability (basic)
   - Show repeater tests
5. Parameter guard
   - Messed up the doc test (“5” instead of 5)
   - Show iex -S mix
   - Show recompile (change Repeating to Repeat - )
6. Parameter matching
7. Case pattern matching
8. Cond control structure
   - After show the with statement from this article:
   - [Elixir's With Statement](http://openmymind.net/Elixirs-With-Statement/)
9. Function matching - structs
   - Show namespace structure
10. Basic process spawning
   - `Repeater.Loop.start(“test”)` - synchronous loop, “blocking”
   - `Repeater.Loop.async(“foo”)` - asynchronous loop
11. Agent
   - Holds state only
   - Module-less: https://elixirschool.com/en/lessons/advanced/concurrency/#agents◦
   - Show only running specific tests
12. New Supervisor App
   - `mix new chat --sup`
   - Creates same app but with /lib/chat/application.ex
13. GenServer
   - Holds state *and* processes
   - Note the cast / call differences
14. Chat.Supervisor
   - Note that there isn’t a way to get the only server, somewhat useless
15. Add :chat_room atom name to Chat.Server
   - Demonstrate in `iex -S mix`
      - `Chat.Server.get_messages(:chat_room)`
      - `Chat.Server.add_message(:chat_room, “test”)`
   - Demonstrate supervisor restarting
      - `Process.whereis(:chat_room)`
      - `Process.whereis(:chat_room) |> Process.exit(:kill)`
      - `Process.whereis(:chat_room)`
16. Name registration from gproc & via_tuple
   - via_tuple - Tells Elixir how to use a custom registry to register our process.
   - `{:via, module, term}`
   - `{:via, gproc, gproc parameters}`
   - gproc params
      - :n - name
      - :l - local, meaning not registered on this cluster
      - {:chat_room, room_name} - actual name

# Further Reading

- [Elixir Documentation](https://hexdocs.pm/elixir/Kernel.html)
- [GenStage](https://elixirschool.com/en/lessons/advanced/gen-stage/)
- [ExDoc](https://elixirschool.com/en/lessons/basics/documentation/#exdoc)


# References

- [Elixir Lang Guide](https://elixir-lang.org/getting-started/introduction.html)
- [ElixirSchool](https://elixirschool.com/en/)
- [Process registry in Elixir: A practical example](https://m.alphasights.com/process-registry-in-elixir-a-practical-example-4500ee7c0dcc)
-
