import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData = dataAsDictionary(fromJSON: "data")
        
        guard let arrayOfBuildings = jsonData["rows"],
            let data = try? JSONSerialization.data(withJSONObject: arrayOfBuildings),
            let decoded = try? JSONDecoder().decode(Building.self, from: data) else { return }
        
        let buildings = decoded.buildingArray
        print(buildings)
    }
}
