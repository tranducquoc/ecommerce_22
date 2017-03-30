class Product < ApplicationRecord
  belongs_to :categorie

  has_many :order_details
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :carts, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :info, presence: true
  validates :price, presence: true, length: {maximum: Settings.maximum_price,
    minimum: Settings.minimum_price}
  validates :categorie_id, presence:true
  validate :image_size

  def self.import file
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row 1
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by(id: row["id"]) || new
      product.attributes = row.to_hash
      product.save!
    end
  end

  def self.open_spreadsheet file
    case File.extname file.original_filename
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else
      raise "Unknown file type: #{file.original_filename}"
    end
  end

  private

  def image_size
    if image.size > Settings.maximum_update_image.megabytes
      errors.add(:image, "picture_than_5MB")
    end
  end
end
