class Facture < ActiveRecord::Base
  belongs_to :user
  has_many :champs, :dependent => :destroy
  accepts_nested_attributes_for :champs, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  attr_accessible   :qualite_responsable ,
                    :nom_responsable,
                    :prenom_responsable,
                    :service_responsable,
                    :fonction_responsable,
                    :regime_tva,
                    :exoneration_tva,
                    :num_facture,
                    :numero_avoir,
                    :date_emission,
                    :devise,
                    :num_client,
                    :echeance,
                    :ref_prod_serv,
                    :description_prod_serv,
                    :montant_ht,
                    :code_tva,
                    :valeur_tva,
                    :montant_tva,
                    :montant_ttc,
                    :accompte,
                    :net_a_payer,
                    :conditions_reglement,
                    :commentaires,
                    :user_id,
         
  date        =/(0[1-9]|[12][0-9]|3[01])+-(0[1-9]|1[012])+-(19|20)\d\d/
  
  #validates :user_id, presence => true
           
  validates :qualite_responsable, :presence => true,
                                  :length => { :maximum => 15}

  validates :nom_responsable,     :presence => true,
                                  :length => { :maximum => 50}
                                  
  validates :prenom_responsable,  :presence => true,
                                  :length => { :maximum => 50}
                          
  validates :service_responsable, :presence => true,
                                  :length => { :maximum => 50}
                              
  validates :fonction_responsable,:presence => true,
                                  :length => { :maximum => 50}
                                  
  validates :regime_tva,          :presence => true
                                  
  validates :exoneration_tva,     :presence => true
  
  validates :num_facture,         :presence => true
                                  
  validates :date_emission,       :presence => true,
                                  :format => { :with => date }
  
  validates :devise,              :presence => true
  
  validates :echeance,            :presence => true,
                                  :format => { :with => date }
  
  validates :montant_ht,          :presence => true
  
  validates :code_tva,            :presence => true
  
  validates :valeur_tva,          :presence => true
  
  validates :montant_tva,         :presence => true
  
  validates :montant_ttc,         :presence => true
  
  validates :net_a_payer,         :presence => true
  
  validates :conditions_reglement,:presence => true
  
  validates :accompte,            :format => { :with => /^(|[\d]+)$/} 
  
  validates :commentaires,        :length => { :maximum => 100}
     
end

# == Schema Information
#
# Table name: factures
#
#  id                    :integer         not null, primary key
#  num_facture           :string(255)
#  qualite_responsable   :string(255)
#  nom_responsable       :string(255)
#  prenom_responsable    :string(255)
#  service_responsable   :string(255)
#  fonction_responsable  :string(255)
#  regime_tva            :string(255)
#  exoneration_tva       :string(255)
#  numero_avoir          :string(255)
#  date_emission         :datetime
#  devise                :string(255)
#  echeance              :datetime
#  ref_prod_serv         :string(255)
#  description_prod_serv :string(255)
#  quantite              :string(255)
#  prix_unitaire         :string(255)
#  montant_ht            :string(255)
#  code_tva              :string(255)
#  valeur_tva            :string(255)
#  montant_tva           :string(255)
#  montant_ttc           :string(255)
#  accompte              :string(255)
#  net_a_payer           :string(255)
#  conditions_reglement  :string(255)
#  commentaires          :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

