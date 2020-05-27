//
//  TrackViewController.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 23.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import UIKit
import SDWebImage
import AVKit

class TrackViewController: UIViewController {
    
    let dragDownButton = UIButton()
    let trackImageView = UIImageView()
    let slider = UISlider()
    let currentSecondsLabel = UILabel()
    let timeLeftLabel = UILabel()
    let trackNameLabel = UILabel()
    let artistNameLabel = UILabel()
    let previousTrackButton = UIButton()
    let startStopButton = UIButton()
    let nextTrackButton = UIButton()
    let volumeSlider = UISlider()
    let offVolumeImageView = UIImageView()
    let onVolumeImageView = UIImageView()
    
    
    let player: AVPlayer = {
       let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
        setupConstraints()
    
    
    }
    func setup(pickedTrack: Track) {
        
        artistNameLabel.text = pickedTrack.artistName
        trackNameLabel.text = pickedTrack.trackName
        
        prostoPoPricolu(previewUrl: pickedTrack.previewUrl)
        
        print(pickedTrack.artworkUrl60)
        let string600 = pickedTrack.artworkUrl60?.replacingOccurrences(of: "60x60", with: "600x600")
        
        guard let url = URL(string: string600 ?? "") else { return }
        trackImageView.sd_setImage(with: url, completed: nil)
        
    }
    
    //func playTrack
    func prostoPoPricolu(previewUrl: String?) {
        guard let url = URL(string: previewUrl ?? "") else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        
    }
}

// MARK: - Actions
extension TrackViewController {
    @objc func playStopButtonPressed() {
       
    }
    
    @objc func volumeChanged() {
        
    }
    
    @objc func trackPositionChanged() {
        
    }
    
    @objc func previousTrackPressed() {
        
    }
    
    @objc func nextTrackPressed() {
        
    }
}

// MARK: - Setup Views
extension TrackViewController {
    func setupElements() {
        view.backgroundColor = .white
        dragDownButton.setImage(#imageLiteral(resourceName: "Drag Down"), for: .normal)
        currentSecondsLabel.text = "00:00"
        timeLeftLabel.text = "--:--"
        
        
        
        timeLeftLabel.textAlignment = .right
        trackNameLabel.textAlignment = .center
        artistNameLabel.textAlignment = .center
        
        trackNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        artistNameLabel.textColor = #colorLiteral(red: 0.9098039216, green: 0.2705882353, blue: 0.3529411765, alpha: 1)
        
        previousTrackButton.setImage(#imageLiteral(resourceName: "Left"), for: .normal)
        startStopButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        nextTrackButton.setImage(#imageLiteral(resourceName: "Right"), for: .normal)
        
        offVolumeImageView.image = #imageLiteral(resourceName: "Icon Min")
        onVolumeImageView.image = #imageLiteral(resourceName: "IconMax")
        
        offVolumeImageView.contentMode = .scaleAspectFit
        onVolumeImageView.contentMode = .scaleAspectFit
        
        startStopButton.addTarget(self, action: #selector(playStopButtonPressed), for: .touchUpInside)
        volumeSlider.addTarget(self, action: #selector(volumeChanged), for: .valueChanged)
        slider.addTarget(self, action: #selector(trackPositionChanged), for: .valueChanged)
        
        previousTrackButton.addTarget(self, action: #selector(previousTrackPressed), for: .touchUpInside)
        nextTrackButton.addTarget(self, action: #selector(nextTrackPressed), for: .touchUpInside)
    }
}


// MARK: - Setup Constraints
extension TrackViewController {
    func setupConstraints() {
        
        
        let topImageStackView = UIStackView(arrangedSubviews: [dragDownButton, trackImageView], axis: .vertical, spacing: 16)
        
        let labelsStackView = UIStackView(arrangedSubviews: [currentSecondsLabel, timeLeftLabel], axis: .horizontal, spacing: 0)
        labelsStackView.distribution = .fillEqually
        let topSliderStackView = UIStackView(arrangedSubviews: [slider, labelsStackView], axis: .vertical, spacing: 4)
        
        let trackInfoStackView = UIStackView(arrangedSubviews: [trackNameLabel, artistNameLabel], axis: .vertical, spacing: 4)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [previousTrackButton, startStopButton, nextTrackButton], axis: .horizontal, spacing: 0)
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .center
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let volimeStackView = UIStackView(arrangedSubviews: [offVolumeImageView, volumeSlider, onVolumeImageView], axis: .horizontal, spacing: 10)
        volimeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let topStackView = UIStackView(arrangedSubviews: [topImageStackView, topSliderStackView, trackInfoStackView], axis: .vertical, spacing: 8)
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topStackView)
        view.addSubview(buttonsStackView)
        view.addSubview(volimeStackView)
        
        trackImageView.heightAnchor.constraint(equalTo: topImageStackView.widthAnchor).isActive = true
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
            
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 16),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            buttonsStackView.bottomAnchor.constraint(equalTo: volimeStackView.topAnchor, constant: -24)

        ])

        offVolumeImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        offVolumeImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        onVolumeImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        onVolumeImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        NSLayoutConstraint.activate([
            volimeStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            volimeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            volimeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
}
