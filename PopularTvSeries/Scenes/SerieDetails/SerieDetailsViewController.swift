//
//  SerieDetailsViewController.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class SerieDetailsViewController: UIViewController {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var firstAirDateLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var similarSeriesLabel: UILabel!
    
    private let presenter: SerieDetailsPresenter
    
    // MARK: Object Lifecycle
    
    init(presenter: SerieDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: "SerieDetailsViewController", bundle: nil)
        presenter.view = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPosterImageView()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    // MARK: Setup Layout Methods
    
    private func setupNavigationBar() {
        title = presenter.title
        let backButtom = UIBarButtonItem(image: UIImage(named: "backButton")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(backButtomPressed))
        backButtom.tintColor = .white
        navigationItem.leftBarButtonItem = backButtom
    }
    
    @objc private func backButtomPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupPosterImageView() {
        posterImageView.setShadow()
    }
    
}

// MARK: SerieDetailsView Interface Implementation

extension SerieDetailsViewController: SeriesDetailsView {
    
    func showLoader() {
        Loader.show(in: self)
    }
    
    func hideLoader() {
        Loader.hide()
    }
    
    func showError(message: String) {
        showAlert(message: message)
    }
    
    func setPosterImage(with image: String) {
        DispatchQueue.main.async {
            self.posterImageView.loadImage(from: image)
        }
    }
    
    func setVoteAverage(with text: String) {
        DispatchQueue.main.async {
            self.voteAverageLabel.text = text
        }
    }
    
    func setFirstAirDate(with text: String) {
        DispatchQueue.main.async {
            self.firstAirDateLabel.text = text
        }
    }
    
    func setOverview(with text: String) {
        DispatchQueue.main.async {
            self.overviewLabel.text = text
        }
    }
    
    func setTitle(with text: String) {
        DispatchQueue.main.async {
            self.titleLabel.text = text
        }
    }
    
    func setGenres(with text: String) {
        DispatchQueue.main.async {
            self.genreLabel.text = text
        }
    }
    
    func setSimilarSeries(with text: String) {
        DispatchQueue.main.async {
            self.similarSeriesLabel.text = text
        }
    }
    
}
