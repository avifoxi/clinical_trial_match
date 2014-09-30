class AddUnmodifiedTrialsToImport < ActiveRecord::Migration
  def change
    add_column :imports, :unmodified_trials, :string
    add_column :imports, :invalid_trials, :string
  end
end
