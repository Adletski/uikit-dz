// AudioViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

// экран для воспроизведения музыки
final class AudioViewController: UIViewController {
    // Properties
    let arrayOfSomething = ["adlet is sending message"]
    var musics = ["rington1", "rington2", "rington3"]
    var player = AVAudioPlayer()
    var isPlaying = false
    var isVolumeOn = true
    var currentIndex = 1

    // IBOutlets
    @IBOutlet private var playPauseButton: UIButton!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var songTitleLabel: UILabel!
    @IBOutlet var musicSwitcherOutlet: UIButton!

    var songTitle = ""

    // Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        do {
            if let url = Bundle.main.url(forResource: "\(musics[currentIndex])", withExtension: "mp3") {
                player = try AVAudioPlayer(contentsOf: url)
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
        durationLabel.text = "-00:\(Int(player.duration))"
        Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(updateSlider),
            userInfo: nil,
            repeats: true
        )
        volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        songTitleLabel.text = songTitle
    }

    // IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        if sender == slider {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func forwardButton(_ sender: UIButton) {
        if currentIndex < musics.count - 1 {
            let result = musics[currentIndex + 1]
            currentIndex += 1
            do {
                if let url = Bundle.main.url(forResource: "\(result)", withExtension: "mp3") {
                    player = try AVAudioPlayer(contentsOf: url)
                    slider.maximumValue = Float(player.duration)
                }
            } catch {
                print("error")
            }
        }
        durationLabel.text = "-00:\(Int(player.duration))"
        playPauseButton.setImage(UIImage(named: "play"), for: .normal)
        isPlaying = false
        player.pause()
    }

    @IBAction func backButton(_ sender: UIButton) {
        if currentIndex > 0 {
            let result = musics[currentIndex - 1]
            currentIndex -= 1
            do {
                if let url = Bundle.main.url(forResource: "\(result)", withExtension: "mp3") {
                    player = try AVAudioPlayer(contentsOf: url)
                    slider.maximumValue = Float(player.duration)
                }
            } catch {
                print("error")
            }
        }
        durationLabel.text = "-00:\(Int(player.duration))"
        playPauseButton.setImage(UIImage(named: "play"), for: .normal)
        isPlaying = false
        player.pause()
    }

    @IBAction func playPauseButton(_ sender: UIButton) {
        if isPlaying {
            playPauseButton.setImage(UIImage(named: "play"), for: .normal)
            isPlaying = false
            player.pause()
        } else {
            playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
            isPlaying = true
            player.play()
        }
    }

    @IBAction func shareTelegramButton(_ sender: UIButton) {
        let shareController = UIActivityViewController(activityItems: arrayOfSomething, applicationActivities: nil)
        present(shareController, animated: true)
    }

    @IBAction func musicSwitcher(_ sender: UIButton) {
        if isVolumeOn {
            musicSwitcherOutlet.setImage(UIImage(named: "musicOff"), for: .normal)
            player.volume = 0
            isVolumeOn = false
        } else {
            musicSwitcherOutlet.setImage(UIImage(named: "musicOn"), for: .normal)
            player.volume = volumeSlider.value
            isVolumeOn = true
        }
    }

    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @objc func updateSlider() {
        slider.value = Float(player.currentTime)
        durationLabel.text = "-00:\(Int(player.duration - player.currentTime))"
    }

    @IBAction func volumeSlider(_ sender: UISlider) {
        player.volume = volumeSlider.value
    }

    @IBAction func openPlaylistButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Упс!", message: "Функционал в разработке :(", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in
            self.view.endEditing(true)
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
