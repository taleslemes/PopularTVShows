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
    
    static let identifier = "seriesCVCell"
    
    // MARK: Override Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cornerOn(.all, radius: 20)
        posterImageView.cornerOn(.top, radius: 20)
        setShadow()
    }
    
    // MARK: Public Methods
    
    func attachViewModel(_ viewModel: SeriesCVCellViewModel) {
        viewModel.attachView(self)
    }

}

// MARK: SeriesCVCellView Interface Implementation

extension SeriesCVCell: SeriesCVCellView {
    
    func setPosterImage(with imageName: String) {
        
    }
    
    func setTitle(with text: String) {
        
    }
    
    func setFirstAirDate(with text: String) {
        
    }
    
    func setVoteAverage(with text: String) {
        
    }
    
}
