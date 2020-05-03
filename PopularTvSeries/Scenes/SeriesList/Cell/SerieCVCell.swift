//
//  SerieCVCell.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class SerieCVCell: UICollectionViewCell {

    // MARK: Properties
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var firstAirDateLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageViewHeightConstraint: NSLayoutConstraint!
    
    static let identifier = "serieCVCell"
    
    // MARK: Override Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cornerOn(.all, radius: 20)
        posterImageView.cornerOn(.top, radius: 20)
        setShadow()
        
        if Device.isIphone5 {
            posterImageViewHeightConstraint.isActive = false
        }
    }
    
    // MARK: Public Methods
    
    func attachPresenter(_ presenter: SerieCVCellPresenter) {
        presenter.attachView(self)
    }

}

// MARK: SerieCVCellView Interface Implementation

extension SerieCVCell: SerieCVCellView {
    
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
