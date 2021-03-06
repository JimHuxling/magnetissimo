defmodule Magnetissimo.Repo.Migrations.Createtorrents do
  use Ecto.Migration

  def change do
    create table(:torrents) do
      add :leechers, :integer, null: false
      add :magnet, :text, null: false
      add :name, :text, null: false
      add :outbound_url, :string, null: false
      add :seeders, :integer, null: false
      add :size, :string, null: false
      add :website_source, :string, null: false

      timestamps()
    end

    create index(:torrents, [:name])
    create index(:torrents, [:website_source])
    create unique_index(:torrents, [:magnet, :name], name: :unique_magnet_name)
  end
end
