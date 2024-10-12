import GNetwork
import GCore

internal protocol HomeRepositoryProtocol: GRepositoryProtocol {
    
    func fetchGames() async throws -> [Game]
    
}

final internal class HomeRepository: GRepository, HomeRepositoryProtocol {
    
    internal init(
        network     :   NetworkManagerProtocol    = NetworkManager(),
        settings    :   ClientSettingsProtocol    = Settings.Client.shared
    ) {
        super.init(network: network)
        self.isPreview  = settings.isPreview
    }

    internal func fetchGames() async throws -> [Game] {
        
        let games: [Game]? = try await request(
            local: { Helper.object(from: HomeModule.bundle!, json: "games") ?? [] },
            remote: { [weak self] in
                try await self?.network.request(method: .post, endpoint: "failed") ?? []
            }
        )
        
        return games.orEmpty
    }
    
    
}
