import SwiftUI
import KotlinLibrary

struct ContentView: View {
    let greeting = Greeting()

    var body: some View {
        VStack(spacing: 12) {
            Text(greeting.greet())
                .font(.headline)
                .multilineTextAlignment(.center)

            Button("Call Bar") {
                greeting.callBar() // Logs to console
            }

            Button("Call Bazz") {
                greeting.callBazz() // Logs to console
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
