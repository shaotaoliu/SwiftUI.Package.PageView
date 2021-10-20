import Foundation

class ParkViewModel: ObservableObject {
    
    var parks: [Park] = []
    
    @Published var hasError = false
    @Published var error: String? = nil {
        didSet {
            hasError = error != nil
        }
    }
    
    init() {
        parks = loadFromFile()
    }
    
    private func loadFromFile() -> [Park] {
        let filename = "nationalparks.json"
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            self.error = "Couldn't find \(filename) in main bundle."
            return []
        }
        
        do {
            data = try Data(contentsOf: file)
        }
        catch {
            self.error = "Couldn't load \(filename) from main bundle: \n\(error)"
            return []
        }
        
        do {
            return try JSONDecoder().decode([Park].self, from: data)
        }
        catch {
            self.error = "Couldn't parse \(filename). Error: \(error)"
            return []
        }
    }
}

struct Park: Codable {
    let name: String
    let imageName: String
    let description: String
}
