//
//  PinterestCollectionViewController.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 15.11.2024.
//

import UIKit

final class CollectionPinterestViewController: UICollectionViewController {
    
    private let networkDataFetcher = RandomPicsFetcher()
    private var photosArray = [UnsplashPhoto]()
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadPhotos()
    }
    
    private func loadPhotos() {
        self.networkDataFetcher.fetchRandomPics { [weak self] (results: Results?) in
            guard let photos = results else {return}
            self?.photosArray = photos.results
            self?.collectionView.reloadData()
        }
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        collectionView.register(PinterestCollectionViewCell.self, forCellWithReuseIdentifier: PinterestCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = #colorLiteral(red: 0.4592262506, green: 0.5283014178, blue: 0.7002335191, alpha: 1)
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.contentInsetAdjustmentBehavior = .automatic
        collectionView.showsVerticalScrollIndicator = false
    }
}

extension CollectionPinterestViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photo = photosArray[indexPath.item]
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availiableWidth = view.frame.width - paddingSpace
        let widthPerItem = availiableWidth / itemsPerRow
        let height = CGFloat(photo.height) * widthPerItem / CGFloat(photo.width)
        return CGSize(width: widthPerItem, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinterestCollectionViewCell.identifier, for: indexPath) as? PinterestCollectionViewCell else { return UICollectionViewCell() }
        let Photo = photosArray[indexPath.item]
        cell.unsplashPhoto = Photo
        return cell
    }
}
