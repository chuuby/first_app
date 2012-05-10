class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nom
      t.string :email
      t.string :raison_sociale
      t.string :adresse
      t.string :code_postal
      t.string :ville
      t.string :pays
      t.string :num_tel_fixe 
      t.string :num_tel_portable 
      t.string :num_fax
      t.string :num_client_cea 
      t.string :num_client
      t.string :date_entree 
      t.string :site_societe 
      t.string :email_societe 
      t.string :numero_siret 
      t.string :domaine_activite 
      t.string :code_ape
      t.string :capital_societe
      t.string :forme_societe 
      t.string :code_siren
      t.string :code_rcs

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
