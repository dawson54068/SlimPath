import ComposableArchitecture
import Features
import SwiftUI

struct MealsView: View {
    let store: StoreOf<MealsFeature>

    init(store: StoreOf<MealsFeature>) {
        self.store = store
    }

    var body: some View {
        Text("Meals")
            .task {
                await store.send(.task).finish()
            }
    }
}
