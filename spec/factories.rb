# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
Factory.define :user do |user|
  user.nom                   "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
  user.raison_sociale        "Monsieur"
  user.adresse               "55 rue du cardinal"
  user.code_postal           "75001"
  user.ville                 "Paris"
  user.pays                  "France"
  user.num_tel_fixe          "0654785682"
  user.num_tel_portable      "0654785682" 
  user.num_client_cea        "dffffffdz8"
  user.num_client            "rrrra09876"
  user.date_entree           "22-09-1994"
  user.site_societe          "fdqsifhd.com"
  user.email_societe         "fdsfdso@ojoifnd.fr"
  user.numero_siret          "12345678901234"
  user.domaine_activite      "Energie"
  user.code_ape              "abcde"
  user.capital_societe       "1000000"
  user.forme_societe         "SARL"
  user.code_siren            "123456789"
  user.code_rcs              "rezsfssfzezf"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :facture do |facture|
  #facture.user_id                 @user.id
  facture.qualite_responsable     "lkjhgf"
  facture.nom_responsable         "User"
  facture.prenom_responsable      "Mich"
  facture.service_responsable     "Comptabilite"
  facture.fonction_responsable    "Directeur"
  facture.regime_tva              "19.6"
  facture.exoneration_tva         "4"
  facture.num_facture             "126"
  facture.numero_avoir            ""
  facture.date_emission           "20-03-2012"
  facture.devise                  "euros"
  facture.echeance                "25-04-2012"
  facture.ref_prod_serv           "alpha"
  facture.description_prod_serv   ""
  facture.quantite                "2"
  facture.prix_unitaire           "54"
  facture.montant_ht              "23"
  facture.code_tva                "1"
  facture.valeur_tva              "22"
  facture.montant_tva             "43"
  facture.montant_ttc             "60"
  facture.accompte                ""
  facture.net_a_payer             "50"
  facture.conditions_reglement    "carte bancaire"
  facture.commentaires            ""
  facture.association :user
end