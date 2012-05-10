require 'spec_helper'

describe Facture do
  before(:each) do
    @user = Factory(:user)
    @attr = {
      :qualite_responsable => "Madame",
      :nom_responsable  => "User",
      :prenom_responsable  => "Mich",
      :service_responsable  => "Comptabilite",
      :fonction_responsable  => "Directeur",
      :regime_tva  => "19.6",
      :exoneration_tva  => "0",
      :num_facture  => "126",
      :numero_avoir  => "",
      :date_emission  => "20-03-2012",
      :devise  => "euros",
      :echeance  => "25-04-2012",
      :ref_prod_serv  => "alpha",
      :description_prod_serv  => "",
      :quantite  => "2",
      :prix_unitaire  => "54",
      :montant_ht  => "23",
      :code_tva  => "1",
      :valeur_tva  => "22",
      :montant_tva  => "43",
      :montant_ttc  => "60",
      :accompte   => "",
      :net_a_payer  => "50",
      :conditions_reglement  => "carte bancaire",
      :commentaires  => "",
    }
  end
  
  it "devrait creer une nouvelle instance dotee des attributs valides" do
    @user.factures.create!(@attr)
  end
  
  describe "associations avec l'utilisateur" do

    before(:each) do
      @facture = @user.factures.create(@attr)
    end

    it "devrait avoir un attribut user" do
      @facture.should respond_to(:user)
    end

    it "devrait avoir le bon utilisateur associe" do
      @facture.user_id.should == @user.id
      @facture.user.should == @user
    end
  end
  
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

