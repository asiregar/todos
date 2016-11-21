Todo.new("Remember the Milk", Date.today)
Todo.all #=> [<#Todo>, <#Todo>]
Todo.last #=> The latest Todo
Todo.find contains: "Milk"
Todo.find exactly: "Remember the Milk"

a = Todo.new("Buy a Newspaper") # Default date should be today
a.title
a.due_date
a.title = "Some new Titles"
a.due_date = Date.parse("xxx") # Should only accept date objects

Todo.sync # Should Synchronise with online Todos Service. This is HARD!
