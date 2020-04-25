//
//  SeriesCVCell.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class SeriesCVCell: UICollectionViewCell {

    // MARK: Properties
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var firstAirDateLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageViewHeightConstraint: NSLayoutConstraint!
    
    static let identifier = "seriesCVCell"
    
    // MARK: Override Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cornerOn(.all, radius: 20)
        posterImageView.cornerOn(.top, radius: 20)
        setShadow()
        
        if Device.isIphoneSE {
            posterImageViewHeightConstraint.isActive = false
            print(frame.height)
        }
    }
    
    // MARK: Public Methods
    
    func attachPresenter(_ presenter: SeriesCVCellPresenter) {
        presenter.attachView(self)
    }

}

// MARK: SeriesCVCellView Interface Implementation

extension SeriesCVCell: SeriesCVCellView {
    
    func setPosterImage(with imageName: String) {
        posterImageView.loadImage(from: imageName)
    }
    
    func setTitle(with text: String) {
        titleLabel.text = text
    }
    
    func setFirstAirDate(with text: String) {
        firstAirDateLabel.text = text
    }
    
    func setVoteAverage(with text: String) {
        voteAverageLabel.text = text
    }
    
}
