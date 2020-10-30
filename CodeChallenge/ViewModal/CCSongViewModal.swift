import UIKit

protocol CCSongsViewDelegate: class {
    func refreshView()
    func showLoader(_ show: Bool)
}
 
class CCSongViewModal: NSObject {

    //MARK: - Varibles -
    private var delegate: CCSongsViewDelegate
    var songs: [CCSong] = [] {
        didSet {
            self.delegate.refreshView()
        }
    }
    
    //MARK: - Initialise Functions -
    init(delegate: CCSongsViewDelegate) {
        self.delegate = delegate
    }
    
    func ready() {
        refreshData()
    }
    
    //MARK: - Fetch Data -
    private func fetchSongs() {
        self.delegate.showLoader(true)  //Show loader
        DataManager.shared.getSongs { [weak self](status, error, message, songsData) in
            self?.delegate.showLoader(false) // Hide Loader
            
            let fetchedSongs = CCSong.convertToModal(songsData: songsData)
            self?.songs = fetchedSongs
        }
    }
    
    func refreshData() {
        fetchSongs()
    }
    
    //MARK: - Table Function -
    func getSongForIndex(index: Int) -> CCSong {
       self.songs[index]
    }
    
    func numberOfRows() -> Int {
        songs.count
    }
}
