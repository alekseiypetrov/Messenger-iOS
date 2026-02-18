import UIKit

final class TextFieldView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let spacing: CGFloat = 4.0
        static let cornerRadius: CGFloat = 14.0
        static let horizontalPadding: CGFloat = 16.0
        
        enum Heights {
            static let forTagLabel: CGFloat = 18.0
            static let forToggleButton: CGFloat = 36.0
            static let forViewInProfile: CGFloat = 50.0
            static let forViewBasic: CGFloat = 58.0
        }
    }
    
    // MARK: - UI-elements
    
    private lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.body
        label.text = "@"
        label.textColor = .mText
        label.textAlignment = .center
        label.constraintEqualSides(withSize: Constants.Heights.forTagLabel)
        return label
    }()
    
    private lazy var toggleButton: UIButton = {
        let button = UIButton()
        button.setImage(.eyeIcon, for: .normal)
        button.addTarget(nil, action: #selector(toggleButtonPushed), for: .touchUpInside)
        button.constraintEqualSides(withSize: Constants.Heights.forToggleButton)
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.font = UIFont.body
        textField.placeholder = self.type.placeholder
        textField.keyboardType = self.type.keyboardType
        textField.isSecureTextEntry = self.type.isSecure
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: self.isInProfile ? Constants.Heights.forViewInProfile : Constants.Heights.forViewBasic).isActive = true
        return textField
    }()
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = Constants.spacing
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Private properties
    
    private let type: TextFieldType
    private let isInProfile: Bool
    
    // MARK: - Initializers
    
    init(typeOfField type: TextFieldType, isInProfile: Bool = false) {
        self.type = type
        self.isInProfile = isInProfile
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Actions
    
    @objc
    private func toggleButtonPushed() {
        textField.isSecureTextEntry.toggle()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .mField
        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true
        addSubviews([hStack])
        [tagLabel, textField, toggleButton]
            .forEach{
                hStack.addArrangedSubview($0)
            }
        tagLabel.isHidden = !(type == .tag)
        toggleButton.isHidden = !type.isSecure
    }
    
    private func setupConstraints() {
        let height = isInProfile ? Constants.Heights.forViewInProfile : Constants.Heights.forViewBasic
        hStack.constraintEdges(to: self, withValue: Constants.horizontalPadding)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
        ])
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
}
