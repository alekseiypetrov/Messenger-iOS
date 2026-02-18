import UIKit

protocol SplashScreenProtocol {
    func showTabBar()
}

final class SplashScreen: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let sizeOfImage: CGFloat = 128.0
    }
    
    // MARK: - UI-elements
    
    private lazy var imageView: UIImageView = UIImageView(image: .launchScreenLogo)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentAuthentification()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        view.backgroundColor = .mBackground
        view.addSubviews([imageView])
        imageView.constraintEqualSides(withSize: Constants.sizeOfImage)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func presentAuthentification() {
        let authViewController = AuthViewController()
        authViewController.setDelegate(self)
        let navController = UINavigationController(rootViewController: authViewController)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}

extension SplashScreen: SplashScreenProtocol {
    func showTabBar() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow })
        else { return }
        let tabBar = TabBarController()
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
}
