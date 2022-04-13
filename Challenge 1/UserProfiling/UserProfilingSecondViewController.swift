//
//  UserProfilingSecondViewController.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 13/04/22.
//

import UIKit

class UserProfilingSecondViewController: UIViewController {

    
    @IBOutlet weak var userProfilingCollectionView: UICollectionView!
    
    var utils = Utils()
    var arrOfMovie: [Movie] = []
    var storage = LocalStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //collecting data from movie
        userProfilingCollectionView.dataSource = self
        //making 2 cells in a row
        userProfilingCollectionView.delegate = self
        userProfilingCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        arrOfMovie = storage.getMovies()
        if arrOfMovie.count == 0 {
            storage.saveMovies()
            arrOfMovie = storage.getMovies()
        }
    }
    

}

//collecting data from movie
extension UserProfilingSecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfilingSecondCollectionViewCell", for: indexPath) as! UserProfilingSecondCollectionViewCell
        cell.setup(with: arrOfMovie[indexPath.row])
        return cell
    }
}
//making 2 cells in a row
extension UserProfilingSecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 240)
    }
}

//making movie image can tap
extension UserProfilingSecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrOfMovie[indexPath.row].movieTitle)
    }
}
