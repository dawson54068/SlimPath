import ComposableArchitecture
import Features
import SwiftUI

package struct AppView: View {
    let store: StoreOf<AppFeature>

    package init(store: StoreOf<AppFeature>) {
        self.store = store
    }

    package var body: some View {
        TabView {
            HomeView(store: store.scope(state: \.home, action: \.home))
                .task {
                    await store.send(.task).finish()
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Dashboard")
                }
            MealsView(store: store.scope(state: \.meals, action: \.meals))
                .tabItem {
                    Image("meals", bundle: .module).renderingMode(.template)
                    Text("Meals")
                }
        }
    }
}

#Preview {
    AppView(
        store: Store(
            initialState: AppFeature.State(),
            reducer: { AppFeature() }
        )
    )
}
