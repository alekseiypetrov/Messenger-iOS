import UIKit

final class TitledTextFieldView: UIView {
    
    // MARK: - UI-elements
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = self.type.title
        label.font = .plainText2
        label.textAlignment = .left
        label.textColor = .mText
        return label
    }()
    
    private lazy var textField: TextFieldView = {
        TextFieldView(typeOfField: self.type, isInProfile: self.isInProfile)
    }()
    
    // MARK: - Private properties
    
    private let type: TextFieldType
    private let isInProfile: Bool
    
    // MARK: - Initializers
    
    init(type: TextFieldType, isInProfile: Bool) {
        self.type = type
        self.isInProfile = isInProfile
        super.init(frame: .zero)
        setupView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Private methods
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .mBackground
        addSubviews([title, textField])
    }
    
    private func setupConstrains() {
        textField.constraintEdges(to: self, withValue: 0.0)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 20.0),
            
            textField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4.0),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
