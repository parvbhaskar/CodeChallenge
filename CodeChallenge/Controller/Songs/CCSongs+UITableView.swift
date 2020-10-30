import UIKit

extension CCSongViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songViewModal?.numberOfRows() ?? 0
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let historyDetailStatusCell = CCSongTableViewCell.songTableViewCellObject(forTable: tableView, indexPath: indexPath)

        guard let songViewModal = songViewModal else { return UITableViewCell() }
        
        historyDetailStatusCell.configureSongCell(viewModal: songViewModal, indexPath: indexPath)
        return historyDetailStatusCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let selectedSong = songViewModal?.getSongForIndex(index: indexPath.row) {
            pushToSongDetailController(song: selectedSong)
        }
    }
}
