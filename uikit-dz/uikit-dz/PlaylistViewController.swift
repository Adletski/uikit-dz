// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран с альбомами
final class PlaylistViewController: UIViewController {
    // MARK: - Initializer

    @IBOutlet var songTitle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("")
    }

    @IBAction func titleButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "audioVC", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let audioVC = segue.destination as? AudioViewController else { return }
        audioVC.songTitle = songTitle.titleLabel?.text ?? "error"
    }
}
