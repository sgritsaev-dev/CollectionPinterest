//
//  PinterestCollectionViewCell.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 15.11.2024.
//

import UIKit
import SDWebImage

final class PinterestCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PinterestCollectionViewCell"
    
    private let PinterestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var unsplashPhoto: UnsplashPhoto! { // тут вообще хз как без ! обойтись
        didSet {
            guard let url = URL(string: unsplashPhoto.urls.small) else { return }
            PinterestImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        PinterestImageView.image = nil
    }
    // спросить нужна ли эта функция, она по идее должна бороться с наслоением, чтоб когда картинка исчезала из view -> она удалялась (изображение). Но я особой разницы не заметил, что с ней, что без нее.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImage()
    }
    
    private func setupImage() {
        addSubview(PinterestImageView)
        
        PinterestImageView.translatesAutoresizingMaskIntoConstraints = false
        
        PinterestImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        PinterestImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        PinterestImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        PinterestImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
