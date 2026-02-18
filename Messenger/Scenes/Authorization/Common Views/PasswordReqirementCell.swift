import UIKit

final class PasswordReqirementCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let emptyCheckmarkImage: UIImage = .filledCircleIcon.withTintColor(.mCheckmark)
        static let heightForTitle: CGFloat = 20.0
    }
    
    // MARK: - Static Properties
    
    static let identifier = "PasswordReqirementCell"
    
    // MARK: - UI-elements
    
    private lazy var statusView: UIImageView = UIImageView(image: Constants.emptyCheckmarkImage)
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .plainText2
        label.textColor = .mText
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Public properties
    
    var image: UIImage {
        didSet {
            statusView.image = image
            switch image {
            case Constants.emptyCheckmarkImage:
                title.textColor = .mText
            case .successCircleIcon:
                title.textColor = .mDarkGreen
            default:
                break
            }
        }
    }
    
    var text: String {
        didSet {
            title.text = text
        }
    }
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        image = Constants.emptyCheckmarkImage
        text = ""
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        image = Constants.emptyCheckmarkImage
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        contentView.backgroundColor = .mField
        contentView.addSubviews([statusView, title])
    }
    
    private func setupConstraints() {
        statusView.constraintEqualSides(withSize: 16.0)
        
        NSLayoutConstraint.activate([
            
            // Status View Constraints
            statusView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            statusView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Title Label Constraints
            title.leadingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: 8.0),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.heightAnchor.constraint(equalToConstant: Constants.heightForTitle),
        ])
    }
}
