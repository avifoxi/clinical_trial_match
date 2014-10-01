class AddUnmodifiedTrialsToImport < ActiveRecord::Migration
  def change
    add_column :imports, :unmodified_trials, :integer
    add_column :imports, :invalid_trials, :integer
    add_column :imports, :num_xml_files, :integer
  end
end
