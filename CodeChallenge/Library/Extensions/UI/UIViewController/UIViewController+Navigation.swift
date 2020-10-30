import UIKit

extension UIViewController {
 
    //MARK: - Move to Song Detail
    internal func pushToSongDetailController(song: CCSong) {
        let songDetailController = CCSongDetailViewController.songDetailInstanceObject()
        songDetailController.song = song
        
        self.navigationController?.pushViewController(songDetailController, animated: true)
    }
}
