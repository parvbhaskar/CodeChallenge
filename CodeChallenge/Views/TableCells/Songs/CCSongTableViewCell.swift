import UIKit

class CCSongTableViewCell: UITableViewCell {

    //MARK: - IBOutlets -
    @IBOutlet weak var songImageView: ImageLoader!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songArtistLabel: UILabel!
    @IBOutlet weak var songTimeLabel: UILabel!

    //MARK: - Initialize cell -
    class func songTableViewCellObject(forTable tableView: UITableView, indexPath: IndexPath) -> CCSongTableViewCell {
        let cell: CCSongTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier(), for: indexPath) as! CCSongTableViewCell
        return cell
    }

    class func registerNib(forTable tableView: UITableView) {
        let orderHistoryNib: UINib = UINib(nibName: CCConstants.CellIdentifiers.songsCell, bundle: nil)
        tableView.register(orderHistoryNib, forCellReuseIdentifier: self.cellIdentifier())
    }
 
    class func cellIdentifier() -> String {
        return CCConstants.CellIdentifiers.songsCell
    }

    //MARK: - View life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK: - Initalize class -
    func configureSongCell(viewModal: CCSongViewModal, indexPath: IndexPath) {
        let song = viewModal.songs[indexPath.row]
        
        if let imageStringUrl = song.artworkUrl100, let imageUrl = URL(string: imageStringUrl) {
            songImageView.loadImageWithUrl(imageUrl)
            songImageView.addCornerRadius()
        }
        
        songTitleLabel.text = (song.trackName ?? CCConstants.GeneralStrings.emptyString) + ", " + (song.collectionName ?? CCConstants.GeneralStrings.emptyString)
        songArtistLabel.text = song.artistName ?? CCConstants.GeneralStrings.emptyString
    
        let convertedValue = (song.trackTimeMillis ?? 0).convertMilliSectondsToMinutesSeconds()
        
        songTimeLabel.text = convertedValue
    }
}
