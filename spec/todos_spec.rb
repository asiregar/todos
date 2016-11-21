describe Todo do

it "initialise a new todo task with arguments" do
  td = Todo.new("Remember the Milk", Date.today)
  expect(td.class).to eq Todo
end

it "should have getter methods for task and due date" do
  td = Todo.new("Remember the Milk", Date.today)
  expect(td.title).to eq "Remember the Milk"
  expect(td.due_date).to eq Date.today
end

it "should have setter methods for task and due date" do
  td = Todo.new("Remember the Milk", Date.today)
  td.title = "Make Cereal"
  td.due_date = Date.parse("02 Jan 2019")
  expect(td.title).to eq "Make Cereal"
  expect(td.due_date).to eq Date.parse("02 Jan 2019")
end

it "'s constructor should only take date objects" do
  expect{Todo.new("Remember the Milk", "1 Jan 2001")}.to raise_error(ArgumentError)
end

it "'s date setter should also only take date objects" do
  td = Todo.new("Remember the Milk", Date.today)
  expect{td.due_date = "02 Jan 2019"}.to raise_error(ArgumentError)
end

it "will create an array of all todos which can be accessed at any time" do
  expect(Todo.all.class).to eq Array
  expect(Todo.all[0].title).to eq "Remember the Milk"
  expect(Todo.all[2].title).to eq "Make Cereal"
end

it "Can access the most recently created Todo" do
  tdlast = Todo.new("Bin Todo list", Date.today)
  expect(Todo.last).to eq tdlast
end

it "can find Todos based on what they contain" do
  findme1 = Todo.new("Como Esta")
  findme2 = Todo.new("Donde Esta")
  expect(Todo.find contains: "Esta").to eq [findme1, findme2]
end

it "can find Todos based on exact contents" do
  findme3 = Todo.new("Lorem Ipsum")
  dontfindme = Todo.new("lorem ipsum")
  expect(Todo.find exactly: "Lorem Ipsum").to eq [findme3]
end
end
