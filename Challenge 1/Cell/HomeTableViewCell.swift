//
//  HomeTableViewCell.swift
//  Challenge 1
//
//  Created by Adam Ibnu fiadi on 11/04/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    let utils = Utils()
    var movieDatas = [Movie]()
    var storage = LocalStorage()
    var currentCell = 0
    
    // Cell ID Initiation
    let firstMovDescId = "FirstMovDescCollectionViewCell"
    let secondtMovDescId = "SecondMovDescCollectionViewCell"
    let thirdMovDescId = "ThirdMovDescCollectionViewCell"
    let fourthMovDescId = "FourthMovDescCollectionViewCell"
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    //button
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    
    //label
    @IBOutlet weak var WatchlistLabel: UILabel!
    @IBOutlet weak var WatchedLabel: UILabel!
    
    var booked: Bool = false
    var checklist: Bool = false
    
    //add target
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib.init(nibName: firstMovDescId, bundle: nil), forCellWithReuseIdentifier: firstMovDescId)
        self.collectionView.register(UINib.init(nibName: secondtMovDescId, bundle: nil), forCellWithReuseIdentifier: secondtMovDescId)
        self.collectionView.register(UINib.init(nibName: thirdMovDescId, bundle: nil), forCellWithReuseIdentifier: thirdMovDescId)
        self.collectionView.register(UINib.init(nibName: fourthMovDescId, bundle: nil), forCellWithReuseIdentifier: fourthMovDescId)
        
        let datas = utils.getRecommendations(indexes: storage.getStorage(key: "userProfilingData"))
//        storage.updateStorage(indexes: [0,1,3], key:"userProfilingData")
        
        // Init Data
        for movie in datas{
            var temp = Movie()
            temp.movieTitle = movie.movieTitle ?? ""
            temp.movieImageUrl = movie.movieImageUrl ?? ""
            temp.movieIndex = movie.movieIndex ?? -1
            temp.movieDescription = movie.movieDescription ?? ""
            temp.movieRuntime = utils.parseRunTimeToString(date: movie.movieRuntime ?? "0")
            temp.movieInfoYear = utils.getYear(date: movie.movieInfoYear ?? "")
            temp.movieRatings = movie.movieRatings ?? ""
            movieDatas.append(temp)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func bookmarkButtonClick(_ sender: UIButton) {
        if booked {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle"), for: .normal)
            booked = false
            WatchlistLabel.text="Add"
            storage.removeWatchList(index: sender.tag, key: "userWatchlistData")
            print(storage.getStorage(key: "userWatchlistData"))
        }else{
            bookmarkButton.setImage(UIImage(systemName: "bookmark.circle.fill"), for: .normal)
            booked = true
            WatchlistLabel.text="Added"
            storage.updateStorage(indexes: [sender.tag], key: "userWatchlistData")
            print(storage.getStorage(key: "userWatchlistData"))
        }
    }
    
    @IBAction func checklistButtonClick(_ sender: UIButton) {
        
        if checklist {
            checklistButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            checklist = false
            WatchedLabel.text="Watched?"
            storage.removeWatchList(index: sender.tag, key: "userWatchedData")
            print(storage.getStorage(key: "userWatchedData"))
        }else{
            checklistButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checklist = true
            WatchedLabel.text="Watched"
            storage.updateStorage(indexes: [sender.tag], key: "userWatchedData")
            print(storage.getStorage(key: "userWatchedData"))
        }
    }
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstMovDescId, for: indexPath) as! FirstMovDescCollectionViewCell
            let movies = movieDatas[currentCell]
            cell.movieTitle.text = movies.movieTitle ?? ""
            cell.backgroundImage.loadFrom(URLAddress: movies.movieImageUrl ?? "")
            cell.movieDescription.text = movies.movieDescription ?? ""
            cell.movieRuntime.text = movies.movieRuntime ?? ""
            cell.movieYear.text = movies.movieInfoYear ?? ""
            cell.movieRating.text = movies.movieRatings ?? ""
            return cell
        }
        else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondtMovDescId, for: indexPath) as! SecondMovDescCollectionViewCell
            return cell
        }
        else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thirdMovDescId, for: indexPath) as! ThirdMovDescCollectionViewCell
            return cell
        }
        else if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fourthMovDescId, for: indexPath) as! FourthMovDescCollectionViewCell
            return cell
        }
        return UICollectionViewCell()
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 860)
    }
}
