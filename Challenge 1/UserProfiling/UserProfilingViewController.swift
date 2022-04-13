//
//  UserProfilingViewController.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 12/04/22.
//

import UIKit

class UserProfilingViewController: UIViewController {

    @IBOutlet weak var userGenreBtn: CheckBox!
    @IBOutlet weak var userCountryBtn: CheckBox!
    @IBOutlet weak var userActorBtn: CheckBox!
    @IBOutlet weak var userProdBtn: CheckBox!
    @IBOutlet weak var userDurationBtn: CheckBox!
    @IBOutlet weak var userMoviesBtn: CheckBox!
    @IBOutlet weak var userSeriesBtn: CheckBox!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        //making 2 cells in a row
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
}

extension UserProfilingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfilingCollectionViewCell", for: indexPath) as! UserProfilingCollectionViewCell
        cell.setup(with: movies[indexPath.row])
        return cell
    }
}
//making 2 cells in a row
extension UserProfilingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

//making movie image can tap
extension UserProfilingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row].title)
    }
}
