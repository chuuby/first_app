class CreateFactures < ActiveRecord::Migration
  def self.up
    create_table :factures do |t|
      t.string  :num_facture
      t.string  :qualite_responsable 
      t.string  :nom_responsable
      t.string  :prenom_responsable
      t.string  :service_responsable
      t.string  :fonction_responsable
      t.string  :regime_tva 
      t.string  :exoneration_tva
      t.string  :numero_avoir
      t.string  :date_emission
      t.string  :devise 
      t.string  :echeance
      t.string  :ref_prod_serv
      t.string  :description_prod_serv
      t.string  :quantite
      t.string  :prix_unitaire
      t.string  :montant_ht
      t.string  :code_tva
      t.string  :valeur_tva
      t.string  :montant_tva
      t.string  :montant_ttc 
      t.string  :accompte
      t.string  :net_a_payer
      t.string  :conditions_reglement
      t.string  :commentaires
      t.string  :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :factures
  end
end
