import GCore
import GNetwork
import SwiftUI

public class HomeModule: Module {
    
    public init() {
        run()
    }
    
    public func configure() {
        
    }
    
    public static var bundle: Bundle? {
        return Bundle(identifier: "com.rafael.pires.Home")
    }
    
}
