import UIKit

extension CCSongViewController: CCSongsViewDelegate {
    func refreshView() {
        self.songsTableView.reloadData()
        self.songRefreshControl.endRefreshing()
    }
     
    func showLoader(_ show: Bool) {
        if show {
            self.view.showLoader()
        }
        else {
            self.view.hideLoader()
        }
    }
}
