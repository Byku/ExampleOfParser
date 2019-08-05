import Foundation

public enum BuildingTypes: String, Decodable {
    /// Галерея
    case Gallery
    /// Магазин
    case Shop
    /// Башня
    case Tower
    /// Неизвестный тип здания
    case Unknown
}

public struct Building: Decodable {
    public let buildingArray: [BaseBuilding]
    
    enum BuildingMetaKey: String, CodingKey {
        case meta
    }
    
    enum BuildingTypeKey: String, CodingKey {
        case type
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.unkeyedContainer()
        var buildingsArrayForType = container
        var buildings = [BaseBuilding]()
        
        var buildingsArray = buildingsArrayForType
        while !buildingsArrayForType.isAtEnd {
            let building = try buildingsArrayForType.nestedContainer(keyedBy: BuildingMetaKey.self)
            let meta = try building.nestedContainer(keyedBy: BuildingTypeKey.self, forKey: .meta)
            
            let type = (try? meta.decode(BuildingTypes.self, forKey: .type)) ?? BuildingTypes.Unknown
            
            switch type {
            case .Gallery:
                buildings.append(try buildingsArray.decode(Gallery.self))
            case .Shop:
                buildings.append(try buildingsArray.decode(Shop.self))
            case .Tower:
                buildings.append(try buildingsArray.decode(Tower.self))
            case .Unknown:
                buildings.append(try buildingsArray.decode(BaseBuilding.self))
            }
            
        }
        self.buildingArray = buildings
    }
}
