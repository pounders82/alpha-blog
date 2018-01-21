class Ckeditor::Assets < ActiveRecord::Base
include Ckeditor::Orm::ActiveRecord::AssetsBase

delegate :url, :current_path, :content_type, to: :data

validates :data, presence: true
end