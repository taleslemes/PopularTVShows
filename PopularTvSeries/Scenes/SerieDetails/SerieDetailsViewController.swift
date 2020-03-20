//
//  SerieDetailsViewController.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class SerieDetailsViewController: UIViewController {

    private let viewModel: SerieDetailsViewModel
    
    // MARK: Object Lifecycle
    
    init(viewModel: SerieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SerieDetailsViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
