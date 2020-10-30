import Foundation

public struct CCSong: Codable {
 
    // MARK: Declaration for string constants to be used to serialize.
    private enum CodingKeys: String, CodingKey {
        case wrapperType = "wrapperType"
        case kind = "kind"
        case artistId = "artistId"
        case collectionId = "collectionId"
        case trackId = "trackId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case trackName = "trackName"
        case collectionCensoredName = "collectionCensoredName"
        case trackCensoredName = "trackCensoredName"
        case artistViewUrl = "artistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case trackViewUrl = "trackViewUrl"
        case previewUrl = "previewUrl"
        case artworkUrl30 = "artworkUrl30"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case trackPrice = "trackPrice"
        case collectionPrice = "collectionPrice"
        case releaseDate = "releaseDate"
        case collectionExplicitness = "collectionExplicitness"
        case trackExplicitness = "trackExplicitness"
        case discCount = "discCount"
        case discNumber = "discNumber"
        case trackCount = "trackCount"
        case trackNumber = "trackNumber"
        case trackTimeMillis = "trackTimeMillis"
        case country = "country"
        case currency = "currency"
        case primaryGenreName = "primaryGenreName"
        case isStreamable = "isStreamable"
    }

    // MARK: Properties
    public var wrapperType: String?
    public var kind: String?
    public var artistId: Double?
    public var collectionId: Double?
    public var trackId: Double?
    public var artistName: String?
    public var collectionName: String?
    public var trackName: String?
    public var collectionCensoredName: String?
    public var trackCensoredName: String?
    public var artistViewUrl: String?
    public var collectionViewUrl: String?
    public var trackViewUrl: String?
    public var previewUrl: String?
    public var artworkUrl30: String?
    public var artworkUrl60: String?
    public var artworkUrl100: String?
    public var trackPrice: Float?
    public var collectionPrice: Float?
    public var releaseDate: String?
    public var collectionExplicitness: String?
    public var trackExplicitness: String?
    public var discCount: Int?
    public var discNumber: Int?
    public var trackCount: Int?
    public var trackNumber: Int?
    public var trackTimeMillis: Double?
    public var country: String?
    public var currency: String?
    public var primaryGenreName: String?
    public var isStreamable: Bool?
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        artistId = try values.decodeIfPresent(Double.self, forKey: .artistId)
        collectionId = try values.decodeIfPresent(Double.self, forKey: .collectionId)
        trackId = try values.decodeIfPresent(Double.self, forKey: .trackId)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
        previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
        artworkUrl30 = try values.decodeIfPresent(String.self, forKey: .artworkUrl30)
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        collectionPrice = try values.decodeIfPresent(Float.self, forKey: .collectionPrice)
        trackPrice = try values.decodeIfPresent(Float.self, forKey: .trackPrice)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness)
        discCount = try values.decodeIfPresent(Int.self, forKey: .discCount)
        discNumber = try values.decodeIfPresent(Int.self, forKey: .discNumber)
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
        trackNumber = try values.decodeIfPresent(Int.self, forKey: .trackNumber)
        trackTimeMillis = try values.decodeIfPresent(Double.self, forKey: .trackTimeMillis)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        isStreamable = try values.decodeIfPresent(Bool.self, forKey: .isStreamable)
    }

    
    static func convertToModal(songsData: [[String: Any]]?) -> [CCSong] {
        guard let songsData = songsData else { return [CCSong]() }

        let decoder = JSONDecoder()
        do {
            let songdata = try JSONSerialization.data(withJSONObject: songsData, options: .prettyPrinted)
            let songs = try decoder.decode([CCSong].self, from: songdata)
            
            return songs
        } catch let error {
            debugPrint("Data parsing error:- \(error.localizedDescription)")
        }
        
        return [CCSong]()
    }
}

