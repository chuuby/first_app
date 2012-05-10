# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120426130219) do

  create_table "champs", :force => true do |t|
    t.string   "description"
    t.string   "TVA"
    t.string   "ref_prod_serv"
    t.string   "quantite"
    t.string   "prix_unitaire"
    t.string   "type"
    t.string   "montant_ht"
    t.string   "facture_id"
    t.string   "montant_tva"
    t.string   "montant_ttc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factures", :force => true do |t|
    t.string   "num_facture"
    t.string   "qualite_responsable"
    t.string   "nom_responsable"
    t.string   "prenom_responsable"
    t.string   "service_responsable"
    t.string   "fonction_responsable"
    t.string   "regime_tva"
    t.string   "exoneration_tva"
    t.string   "numero_avoir"
    t.string   "date_emission"
    t.string   "devise"
    t.string   "echeance"
    t.string   "ref_prod_serv"
    t.string   "description_prod_serv"
    t.string   "quantite"
    t.string   "prix_unitaire"
    t.string   "montant_ht"
    t.string   "code_tva"
    t.string   "valeur_tva"
    t.string   "montant_tva"
    t.string   "montant_ttc"
    t.string   "accompte"
    t.string   "net_a_payer"
    t.string   "conditions_reglement"
    t.string   "commentaires"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "nom"
    t.string   "email"
    t.string   "raison_sociale"
    t.string   "adresse"
    t.string   "code_postal"
    t.string   "ville"
    t.string   "pays"
    t.string   "num_tel_fixe"
    t.string   "num_tel_portable"
    t.string   "num_fax"
    t.string   "num_client_cea"
    t.string   "num_client"
    t.string   "date_entree"
    t.string   "site_societe"
    t.string   "email_societe"
    t.string   "numero_siret"
    t.string   "domaine_activite"
    t.string   "code_ape"
    t.string   "capital_societe"
    t.string   "forme_societe"
    t.string   "code_siren"
    t.string   "code_rcs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

end
