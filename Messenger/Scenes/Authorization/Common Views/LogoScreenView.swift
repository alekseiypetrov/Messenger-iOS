import UIKit

final class LogoScreenView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let darkBlue = UIColor(red: 0.0, green: 102.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        static let viewCornerRadius: CGFloat = 20.0
        static let viewSize: CGFloat = 96.0
    }
    
    // MARK: - UI-elements
    
    private lazy var iconView = UIImageView()
    
    // MARK: - Private Properties
    
    private var image: UIImage
    private var size: CGFloat
    
    // MARK: - Content Size
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: Constants.viewSize, height: Constants.viewSize)
    }
    
    // MARK: - Initializers
    
    init(typeOfScreen type: LogoScreenType) {
        image = type.image
        size = type.sizeOfImage
        super.init(frame: .zero)
        createGradient(type)
        setupView()
    }

    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first { $0 is CAGradientLayer }?.frame = bounds
    }
    
    // MARK: - Private methods
    
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
    
    private func setupView() {
        layer.cornerRadius = Constants.viewCornerRadius
        clipsToBounds = true
        addSubview(iconView)
        iconView.image = image
        iconView.constraintEqualSides(withSize: size)
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
