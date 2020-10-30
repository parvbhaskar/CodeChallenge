import UIKit

class CCSongViewController: UIViewController {
    
    //MARK: - IBOutlet -
    @IBOutlet weak var songsTableView: UITableView!
    
    //MARK: - Variable -
    var songRefreshControl = UIRefreshControl()
    var songViewModal: CCSongViewModal?

    //MARK: - View life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
    }
    
    //MARK: - Controller View Setup Functions -
    func initializeView() {
        // Setup ViewModal
        songViewModal = CCSongViewModal(delegate: self)
        songViewModal?.ready()
        
        // Setup TableView
        configureSongsTableView()
    }
     
    func configureSongsTableView() {
        //Register table
        self.songsTableView.estimatedRowHeight = 100.0
        self.songsTableView.rowHeight = UITableView.automaticDimension
        self.songsTableView.tableFooterView = UIView()

        //Register nib
        CCSongTableViewCell.registerNib(forTable: self.songsTableView)
        
        //Initialize refresh control
        self.songRefreshControl.tintColor = CCConstants.Color.themeRefreshControlOrangeColor
        self.songRefreshControl.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        self.songsTableView.addSubview(self.songRefreshControl)
        self.songRefreshControl.addTarget(self, action: #selector(self.refreshSongs), for: UIControl.Event.valueChanged)
    }
    
    //MARK: - Change status bar color to light -
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    //MARK: - RefreshControl function -
    @objc func refreshSongs() {
        songViewModal?.refreshData()
    }
}
