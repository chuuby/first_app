class Champ < ActiveRecord::Base
  belongs_to :facture
  attr_accessible :description,
                  :TVA,
                  :ref_prod_serv,
                  :quantite,
                  :prix_unitaire,
                  :type,
                  :montant_ht,
                  :facture_id,
                  :montant_tva,
                  :montant_ttc,

                  prix = /(\d+[,]+\d{0,2}|\d)/

  validates :prix_unitaire,       :presence => true,
            :format => { with => prix }
  validates :ref_prod_serv,       :presence => true
  validates :TVA,                 :presence => true,
            :format => { :with => prix }
  validates :quantite,            :presence => true,
            :format => { :with => prix}
  validates :type,                :presence => true
  validates :description,          :format => { :with => /^(|[\w]+)$/}

end
