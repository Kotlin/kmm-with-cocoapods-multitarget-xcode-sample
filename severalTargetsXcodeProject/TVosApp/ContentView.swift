import SwiftUI
import KotlinLibrary

struct ContentView: View {
    let greeting = Greeting()

    var body: some View {
        VStack(spacing: 40) {
            Text(greeting.greet())
                .font(.title)
                .multilineTextAlignment(.center)

            HStack(spacing: 40) {
                Button("Call Bar") {
                    greeting.callBar() // Logs to console
                }
                .buttonStyle(.borderedProminent)

                Button("Call Bazz") {
                    greeting.callBazz() // Logs to console
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
