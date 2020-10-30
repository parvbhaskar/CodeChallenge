import UIKit
import AVKit

class CCSongDetailViewController: UIViewController {

    //MARK: - IBOutlet -
    @IBOutlet weak var songImageView: ImageLoader!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionnameLabel: UILabel!
    @IBOutlet weak var playPreviewButton: CCCustomButton!
    
    //MARK: - Variable -
    var song: CCSong?
    
    //MARK: - Instance object -
    class func songDetailInstanceObject() -> CCSongDetailViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard.mainStoryboard()
        let songDetailController = mainStoryboard.instantiateViewController(withIdentifier: CCConstants.StoryboardId.songDetail) as! CCSongDetailViewController
        return songDetailController
    }

    //MARK: - View life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
    }
    
    //MARK: - Controller View Setup Functions -
    func initializeView() {
        if let imageUrlString = song?.artworkUrl100, let imageUrl = URL(string: imageUrlString) {
            songImageView.loadImageWithUrl(imageUrl)
        }
        songImageView.makeRoundImage()
        
        trackNameLabel.text = song?.trackName ?? ""
        artistNameLabel.text = song?.artistName ?? ""
        collectionnameLabel.text = song?.collectionName ?? ""
    }
    
    //MARK: - Change status bar color to light -
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    //MARK: - IBAction's -
    @IBAction func playPreviewButtonTapped(_ sender: Any) {
        let audioURLString = song?.previewUrl ?? ""
        
        playAudio(audioUrlString: audioURLString)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
     
    //MARK: - Others -
    func playAudio(audioUrlString: String) {
        if let audioUrl = URL(string: audioUrlString) {
            let player = AVPlayer(url: audioUrl)
            let playerViewController = AVPlayerViewController()

            let image = ImageLoader(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            image.contentMode = .center
            
            // Add artwork on empty screen
            if let imageStringUrl = song?.artworkUrl100, let imageUrl = URL(string: imageStringUrl) {
                image.loadImageWithUrl(imageUrl)
            }
            
            playerViewController.player = player
            playerViewController.contentOverlayView?.addSubview(image)
            
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
}
