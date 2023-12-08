class AddVisitCountToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :visit_count, :integer, default: 0
  end
end
