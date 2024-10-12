import GUikit

final internal class HomeViewModel: ObservableObject {
    
    @Published internal var state: ViewState<[Game]> = .loading
    
    private let repository: HomeRepositoryProtocol
    
    internal init(repository: HomeRepositoryProtocol = HomeRepository()) {
        self.repository = repository
    }
    
    @MainActor
    internal func fetchGames() async {
        do {
            state = .success(try await repository.fetchGames())
        } catch let error {
            state = .error(error)
        }
    }
    
}
