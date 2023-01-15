//
//  ViewController.swift
//  ThirdHomework
//
//  Created by Sefa İbiş on 9.01.2023.
//

import UIKit
import Kingfisher

class LandingVC: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gameList: [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupUI()

        
    }
    private func setupUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(nibName: "GameCell", bundle: nil ), forCellWithReuseIdentifier: "GameCell")
    }
    
    private func fetchData() {

        if let url = URL(string: "\(ApiRelated.url)?key=\(ApiRelated.apiKey)"){
            var request: URLRequest = .init(url: url)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if error != nil{
                    return
                }
                if let data = data{
                    do {
                        let decodedResponse = try! JSONDecoder().decode(GamesResponse.self, from: data)
                        if let list = decodedResponse.results{
                            self.gameList = list
                        }

                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    } catch  {
                        print("Decoding Error")
                    }
                }
            }
            task.resume()
        }
    }
}
    
extension LandingVC: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let games = gameList{
            return games.count
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as? GameCell {
            let game = self.gameList?[indexPath.row]
            // GameCell Fields
            let url = URL(string: game?.background_image ?? "")
            gameCell.imageView.kf.setImage(with: url)
            if let rating = game?.rating{
                gameCell.ratingLabel.text = String(rating)
            }
            if let genres = game?.genres{
                gameCell.genreLabel.text = genres.reduce(""){ x, y in x + y.name! + " " }
            }
            gameCell.nameLabel.text = game?.name
            if let releaseDate =  game?.released{
                gameCell.releasedLabel.text = releaseDate
            }
            return gameCell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {

            return 200
    }
}

extension LandingVC: UICollectionViewDelegate{
    
}

    
    

