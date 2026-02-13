import UIKit

final class LogoScreenView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let darkBlue = UIColor(red: 0.0, green: 102.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
    }
    
    // MARK: - UI-elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    
    init(typeOfScreen type: LogoScreenType) {
        super.init(frame: .zero)
        setImage(type)
        let gradient = getGradient(type)
        setupView(with: gradient)
    }

    required init?(coder: NSCoder) { nil }
    
    // MARK: - Private methods
    
    private func setImage(_ type: LogoScreenType) {
        switch type {
        case .authorization, .accountRegistration:
            imageView.image = .helloIcon
        case .accountRecovery:
            imageView.image = .clockIcon
        case .mailConfirmation:
            imageView.image = .mailIcon
        case .passwordReset:
            imageView.image = .successIcon
        }
    }
    
    private func getGradient(_ type: LogoScreenType) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        switch type {
        case .authorization, .accountRegistration:
            gradient.colors = [
                UIColor.mBlue,
                Constants.darkBlue]
        default:
            gradient.colors = [
                UIColor.white,
                UIColor.white]
        }
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        return gradient
    }
    
    private func setupView(with gradient: CAGradientLayer) {
        self.backgroundColor = .clear
        self.layer.insertSublayer(gradient, at: 0)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 48.0),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
    }
}
