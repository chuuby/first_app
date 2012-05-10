class CreateChamps < ActiveRecord::Migration
  def self.up
    create_table :champs do |t|
      t.string :description
      t.string :TVA
      t.string :ref_prod_serv
      t.string :quantite
      t.string :prix_unitaire
      t.string :type
      t.string :montant_ht
      t.string :facture_id
      t.string :montant_tva
      t.string :montant_ttc

      t.timestamps
    end
  end

  def self.down
    drop_table :champs
  end
end
