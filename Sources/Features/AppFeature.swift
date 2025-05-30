import ComposableArchitecture
import Models

@Reducer
package struct AppFeature {
    @ObservableState
    package struct State: Equatable {
        package var home = HomeFeature.State()
        package var meals = MealsFeature.State()

        package init() {}
    }

    package enum Action: Equatable {
        case task
        case home(HomeFeature.Action)
        case meals(MealsFeature.Action)
    }

    package init() {}

    package var body: some ReducerOf<Self> {
        Scope(state: \.home, action: \.home) {
            HomeFeature()
        }
        Scope(state: \.meals, action: \.meals) {
            MealsFeature()
        }
        Reduce(core)
    }

    package func core(state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .task:
            return .none

        case .home:
            return .none
        
        case .meals:
            return .none
        }
    }
}
