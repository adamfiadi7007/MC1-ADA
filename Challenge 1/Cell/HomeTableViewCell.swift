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
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movies = movieDatas[currentCell]
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstMovDescId, for: indexPath) as! FirstMovDescCollectionViewCell
            cell.movieTitle.text = movies.movieTitle ?? ""
            cell.backgroundImage.loadFrom(URLAddress: movies.movieImageUrl ?? "")
            cell.movieDescription.text = movies.movieDescription ?? ""
            cell.movieRuntime.text = movies.movieRuntime ?? ""
            cell.movieYear.text = movies.movieInfoYear ?? ""
            cell.movieRating.text = movies.movieRatings ?? ""
            cell.bookmarkButton.tag = movies.movieIndex ?? -1
            cell.checklistButton.tag = movies.movieIndex ?? -1
            
            if !storage.getStorage(key: "userWatchedData").contains(movies.movieIndex ?? -1) {
                cell.checklistButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                cell.WatchedLabel.text="Watched?"
            }else{
                cell.checklistButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                cell.WatchedLabel.text="Watched"
            }
            if !storage.getStorage(key: "userWatchlistData").contains(movies.movieIndex ?? -1)  {
                cell.bookmarkButton.setImage(UIImage(systemName: "bookmark.circle"), for: .normal)
                cell.WatchlistLabel.text="Add"
            }else{
                cell.bookmarkButton.setImage(UIImage(systemName: "bookmark.circle.fill"), for: .normal)
                cell.WatchlistLabel.text="Added"
            }
            return cell
        }
        else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondtMovDescId, for: indexPath) as! SecondMovDescCollectionViewCell
            cell.backgroundImage.loadFrom(URLAddress: movies.movieImageUrl ?? "")
            return cell
        }
        else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thirdMovDescId, for: indexPath) as! ThirdMovDescCollectionViewCell
            cell.backgroundImage.loadFrom(URLAddress: movies.movieImageUrl ?? "")
            return cell
        }
        else if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fourthMovDescId, for: indexPath) as! FourthMovDescCollectionViewCell
            cell.backgroundImage.loadFrom(URLAddress: movies.movieImageUrl ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 860)
    }
}
