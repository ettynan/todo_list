import SwiftUi

struct ContentView: View{
    @State var todos: [String] = [
        "End world conflict",
        "Walk an hour",
        "Make meals",
        "Solve for x",
        "Read for 30 min"
    ]

    @State var showingAlert: Bool = false
    @State var newItem = ""

    func addNewItem() {
        todos.append(newItem)
        newItem = ""
    }

    var body: some View {
        NavigationStack{
            List($todos, id: \.self, editActions: .all) { $todoItem in 
                Text(todoItem)
            }.navigationTitle("My to do list")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.alert("What do you need to do?", isPresented: $showingAlert) {
            TextField("Add item here", text: $newItem)
            Button {
                addnewItem()
            } label: {
                Text("Ok")
            }
        }
    }
}

#Preview {
    ContentView()
}