import SwiftUI
import GNetwork
import GUikit

public struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    public init() { }
    
    public var body: some View {
        NavigationView {
            contentView
                .navigationTitle("Games")
                .task {
                    await viewModel.fetchGames()
                }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        GView(state: viewModel.state) {
            ProgressView("Loading...")
        } successView: { games in
            List(games) { game in
                Text(game.name)
            }
        } errorView: { error in
            Text("Error: teste")
        }
    }
}

#Preview("English") {
    HomeView()
}
