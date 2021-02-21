class AddLinkSpotifyToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :link_spotify, :string
  end
end
