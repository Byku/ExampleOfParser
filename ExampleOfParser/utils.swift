import Foundation

func dataFromFile(_ fileName: String) -> Data {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "json"),
        let dataStr = try? String(contentsOfFile: path),
        let data = dataStr.data(using: .utf8) else { return Data() }
    return data
}

func dataAsDictionary(fromJSON fileName: String) -> Dictionary<String, Any> {
    guard let dict = try? JSONSerialization.jsonObject(with: dataFromFile(fileName)) else { return [:] }
    return dict as! Dictionary<String, AnyObject>
}
