alias ElixirPhoenixPractice.Repo
alias ElixirPhoenixPractice.Example_Context.Example

Repo.insert! %Example {
  name: "Jimmy",
  description: "Jimmy is a software developer",
  age: 20,
  height: 5.9,
  working: true
}

Repo.insert! %Example {
  name: "Jane",
  description: "Is an accountant",
  age: 40,
  height: 4.4,
  working: true
}

Repo.insert! %Example {
  name: "Billy",
  description: "Is a construction worker",
  age: 40,
  height: 4.2,
  working: true
}
Repo.insert! %Example {
  name: "Billie",
  description: "Is an accountant",
  age: 40,
  height: 4.9,
  working: true
}
Repo.insert! %Example {
  name: "Jimima",
  description: "Is a nurse",
  age: 2345,
  height: 12.0,
  working: true
}
