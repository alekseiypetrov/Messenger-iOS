import UIKit

final class LogoScreenView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let darkBlue = UIColor(red: 0.0, green: 102.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        static let viewCornerRadius: CGFloat = 20.0
        static let viewSize: CGFloat = 96.0
    }
    
    // MARK: - UI-elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Content Size
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: Constants.viewSize, height: Constants.viewSize)
    }
    
    // MARK: - Initializers
    
    init(typeOfScreen type: LogoScreenType) {
        super.init(frame: .zero)
        setImage(type)
        createGradient(type)
        setupView(ofType: type)
    }

    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first { $0 is CAGradientLayer }?.frame = bounds
    }
    
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
    
    private func createGradient(_ type: LogoScreenType) {
        switch type {
        case .authorization, .accountRegistration:
            let gradient = CAGradientLayer()
            gradient.cornerRadius = Constants.viewCornerRadius
            gradient.colors = [
                UIColor.mBlue.cgColor,
                Constants.darkBlue.cgColor
            ]
            layer.addSublayer(gradient)
        default:
            backgroundColor = .mField
        }
    }
    
    private func getSizeOfImage(_ type: LogoScreenType) -> CGFloat {
        switch type {
        case .authorization, .accountRegistration:
            return 32.0
        default:
            return 48.0
        }
    }
    
    private func setupView(ofType type: LogoScreenType) {
        layer.cornerRadius = Constants.viewCornerRadius
        clipsToBounds = true
        addSubview(imageView)
        let size = getSizeOfImage(type)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: size),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
    }
}
