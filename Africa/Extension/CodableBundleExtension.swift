import Foundation

extension Bundle {
    func toModel(_ file: String) -> [CoverImage] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }

        guard let loaded = try? JSONDecoder().decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }

        return loaded
    }
}
