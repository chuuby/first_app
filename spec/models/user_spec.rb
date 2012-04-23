require 'spec_helper'

describe User do
    before(:each) do
      @attr = {
            :nom => "Utilisateur exemple",
            :email => "user@example.com",
            :password => "foobar",
            :password_confirmation => "foobar"
            :raison_sociale => "Monsieur"
            :adresse => "55 rue du cardinal"
            :code_postal => "75001"
            :ville => "Paris"
            :pays => "France"
            :num_tel_fixe => "0654785682"
            :num_tel_portable => "0654785682" 
            :num_fax 
            :num_client_cea => "dffffffdz8"
            :num_client => "rrrra09876"
            :date_entree => "22-09-1994"
            :site_societe  => "fdqsifhd.com"
            :email_societe => "fdsfdso@ojoifnd.fr"
            :numero_siret => "12345678901234"
            :domaine_activite => "Energie"
            :code_ape => "abcde"
            :capital_societe => "1000000"
            :forme_societe => "SARL"
            :code_siren => "123456789"
            :code_rcs => "rezsfssfzezf"
          }
    end

    it "devrait créer une nouvelle instance dotée des attributs valides" do
      User.create!(@attr)
    end

    it "exige un nom" do
        bad_guy = User.new(@attr.merge(:nom => ""))
        bad_guy.should_not be_valid
      end
      
    it "exige une adresse email" do
        no_email_user = User.new(@attr.merge(:email => ""))
        no_email_user.should_not be_valid
    end
    
    it "devrait rejeter les noms trop longs" do
        long_nom = "a" * 31
        long_nom_user = User.new(@attr.merge(:nom => long_nom))
        long_nom_user.should_not be_valid
      end
    
    it "devrait accepter une adresse email valide" do
        adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
        adresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "devrait rejeter une adresse email invalide" do
        adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
        adresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
      
    it "devrait rejeter un email double" do
        # Place un utilisateur avec un email donné dans la BD.
        User.create!(@attr)
        user_with_duplicate_email = User.new(@attr)
        user_with_duplicate_email.should_not be_valid
      end
    end
    
    it "devrait rejeter une adresse email invalide jusqu'à la casse" do
        upcased_email = @attr[:email].upcase
        User.create!(@attr.merge(:email => upcased_email))
        user_with_duplicate_email = User.new(@attr)
        user_with_duplicate_email.should_not be_valid
      end
      
    it "exige une raison sociale" do
        no_raison_user = User.new(@attr.merge(:raison_sociale => ""))
        no_raison_user.should_not be_valid
    
    it "devrait rejeter une raison trop longue" do
        invalid_raison_user = User.new(@attr.merge(:raison_sociale => "a"*31))
        invalid_raison_user.should_not be_valid
        
    it "exige une adresse" do
        no_adresse_user = User.new(@attr.merge(:adresse => ""))
        no_adresse_user.should_not be_valid
        
    it "devrait rejeter adresse trop longue" do
        invalid_adresse_user = User.new()(@attr.merge(:adresse => "a"*151))
        invalid_adresse_user.should_not be_valid
        
    it "exige un code postal" do
        no_cp_user = User.new(@attr.merge(:code_postal => ""))
        no_cp_user.should_not be_valid
        
    it "devrait rejeter un code postal invalide" do
        cp = /[\D+\-.]/
        invalid_cp_user = User.new(@attr.merge(:code_postal => cp))
        invalid_cp_user.should_not be_valid
      
    it "devrait accepter un code postal valide" do
        valid_cp_user = User.new(@attr.merge(:code_postal => "11111"))
        valid_cp_user.should be_valid
    
    it "devrait rejeter un mod de passe trop long" do
        invalid_cp_user = User.new(@attr.merge(:code_postal => "1"*6))
        invalid_cp_user.should_not be_valid
        
    it "exige un pays" do
        no_pays_user = User.new(@attr.merge(:pays => ""))
        no_pays_user.should_not be_valid
    
    it "devrait rejeter un pays trop long" do
        invalid_pays_user = User.new(@attr.merge(:pays => "a"*26 ))
        invalid_pays_user.should_not be_valid
    
    it "exige un numero de telephone fixe" do
        no_num_tel_fixe_user = User.new(@attr.merge(:num_tel_fixe => ""))
        no_num_tel_fixe_user.should_not be_valid
        
    it "devrait rejeter un numero de telephone fixe trop long" do
        invalid_num_tel_fixe_user = User.new(@attr.merge(:num_tel_fixe => "1"*16))
        invalid_num_tel_fixe_user.should_not be_valid
        
    it "devrait rejeter un numero de telephone fixe invalide" do
        tel_fixe = /[\D+\-.]/
        invalid_num_tel_fixe_user = User.new(@attr.merge(:num_tel_fixe => tel_fixe))
        invalid_num_tel_fixe_user.should_not be_valid
        
    it "exige un numero de telephone portable" do
        no_num_tel_portable_user = User.new(@attr.merge(:num_tel_portable => "")
        no_num_tel_portable_user.should_not be_valid

    it "devrait rejeter un numero de telephone portable trop long" do
        invalid_num_tel_portable_user = User.new(@attr.merge(:num_tel_portable => "1"*16))
        invalid_num_tel_portable_user.should_not be_valid

    it "devrait rejeter un numero de telephone portable invalide" do
        tel_fixe = /[\D+\-.]/
        invalid_num_tel_portable_user = User.new(@attr.merge(:num_tel_portable => tel_fixe))
        invalid_num_tel_portable_user.should_not be_valid
            
    it "exige un numero de fax" do
        no_num_fax_user = User.new(@attr.merge(:num_fax => ""))
        no_num_fax_user.should_not be_valid

    it "devrait rejeter un numero de telephone fixe trop long" do
        invalid_num_fax_user = User.new(@attr.merge(:num_fax => "1"*16))
        invalid_num_fax_user.should_not be_valid

    it "devrait rejeter un numero de telephone fixe invalide" do
        tel_fixe = /[\D+\-.]/
        invalid_num_fax_user = User.new(@attr.merge(:num_fax => tel_fixe))
        invalid_num_fax_user.should_not be_valid
        
      describe "password validations" do

         it "devrait exiger un mot de passe" do
           User.new(@attr.merge(:password => "", :password_confirmation => "")).
             should_not be_valid
         end

         it "devrait exiger une confirmation du mot de passe qui correspond" do
           User.new(@attr.merge(:password_confirmation => "invalid")).
             should_not be_valid
         end

         it "devrait rejeter les mots de passe (trop) courts" do
           short = "a" * 5
           hash = @attr.merge(:password => short, :password_confirmation => short)
           User.new(hash).should_not be_valid
         end

         it "devrait rejeter les (trop) longs mots de passe" do
           long = "a" * 41
           hash = @attr.merge(:password => long, :password_confirmation => long)
           User.new(hash).should_not be_valid
         end
       end
       
    describe "password encryption" do

       before(:each) do
         @user = User.create!(@attr)
       end

       it "devrait avoir un attribut  mot de passe crypté" do
         @user.should respond_to(:encrypted_password)
       end
       
       it "devrait définir le mot de passe crypté" do
            @user.encrypted_password.should_not be_blank
          end
          
      describe "Méthode has_password?" do

         it "doit retourner true si les mots de passe coïncident" do
           @user.has_password?(@attr[:password]).should be_true
         end    

         it "doit retourner false si les mots de passe divergent" do
           @user.has_password?("invalide").should be_false
         end 
         
       describe "authenticate method" do

        it "devrait retourner nul en cas d'inéquation entre email/mot de passe" do
           wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
           wrong_password_user.should be_nil
         end

         it "devrait retourner nil quand un email ne correspond à aucun utilisateur" do
           nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
           nonexistent_user.should be_nil
         end

         it "devrait retourner l'utilisateur si email/mot de passe correspondent" do
           matching_user = User.authenticate(@attr[:email], @attr[:password])
           matching_user.should == @user
         end
         
        end   
       end
     end
  end
 

# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  nom                :string(255)
#  email              :string(255)
#  raison_sociale     :string(255)
#  adresse            :string(255)
#  code_postal        :string(255)
#  ville              :string(255)
#  pays               :string(255)
#  num_tel_fixe       :string(255)
#  num_tel_portable   :string(255)
#  num_fax            :string(255)
#  num_client_cea     :string(255)
#  num_client         :string(255)
#  date_entree        :datetime
#  site_societe       :string(255)
#  email_societe      :string(255)
#  numero_siret       :string(255)
#  domaine_activite   :string(255)
#  code_ape           :string(255)
#  capital_societe    :string(255)
#  forme_societe      :string(255)
#  code_siren         :string(255)
#  code_rcs           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

