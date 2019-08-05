import Foundation

public class BaseBuilding: Decodable {
    var address: String
    var meta: BuidingMeta
    
    private enum CodingKeys: String, CodingKey {
        case address, meta
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(String.self, forKey: .address)
        self.meta = try container.decode(BuidingMeta.self, forKey: .meta)
    }
}

public struct BuidingMeta: Decodable {
    public let type: String
}

class Shop: BaseBuilding {
    let isDIY: Bool
    
    enum ShopCodingKeys: String, CodingKey {
        case isDIY
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ShopCodingKeys.self)
        self.isDIY = try container.decode(Bool.self, forKey: .isDIY)
        try super.init(from: decoder)
    }
}

class Gallery: BaseBuilding {
    let artCount: Int
    
    enum GalleryCodingKeys: String, CodingKey {
        case artCount
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GalleryCodingKeys.self)
        self.artCount = try container.decode(Int.self, forKey: .artCount)
        try super.init(from: decoder)
    }
}

class Tower: BaseBuilding {
    let height: Double
    
    enum TowerCodingKeys: String, CodingKey {
        case height
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TowerCodingKeys.self)
        self.height = try container.decode(Double.self, forKey: .height)
        try super.init(from: decoder)
    }
}
