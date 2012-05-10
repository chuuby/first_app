require 'digest'

class User < ActiveRecord::Base
  has_many        :factures
  attr_accessor   :password
  attr_accessible :nom, :email,:password, :password_confirmation, 
                  :raison_sociale, 
                  :adresse, 
                  :code_postal,
                  :ville,
                  :pays,
                  :num_tel_fixe, 
                  :num_tel_portable , 
                  :num_fax, 
                  :num_client_cea,
                  :date_entree,
                  :site_societe , 
                  :email_societe, 
                  :numero_siret ,
                  :domaine_activite ,
                  :code_ape,
                  :capital_societe,
                  :forme_societe ,
                  :code_siren,
                  :code_rcs,
                  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  date        =/(0[1-9]|[12][0-9]|3[01])+-(0[1-9]|1[012])+-(19|20)\d\d/
  
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false } 
  
  validates :nom, :presence => true,
                  :length   => { :maximum => 30 }
                
  
  validates :raison_sociale,  :presence => true,
                              :length   => { :maximum => 30 }
  
  validates :adresse, :presence => true,
                      :length   => { :maximum => 150 }
  
  validates :code_postal, :presence => true,
                          :format => { :with => /[0-9]/},
                          :length => { :maximum => 5}
  
  validates :pays, :presence => true,
                   :length => { :maximum => 25}
  
  validates :num_tel_fixe,  :presence => true,
                            :length => { :maximum => 15},
                            :format => { :with => /[0-9]/}
  
  validates :num_tel_portable,  :presence => true,
                                :length => { :maximum => 15 },
                                :format => { :with => /[0-9]/ }            
  
  validates :num_fax,       :length => { :maximum => 15},
                            :format => { :with => /^(|[0-9]+)$/}      
  
  validates :num_client_cea, :presence => true,
                            :length => { :maximum => 10}
  
  validates :date_entree,    :presence => true,
                            :format => { :with => date}
  
  validates :site_societe,   :presence => true,
                            :length => { :maximum => 20 }
  
  validates :email_societe,  :presence => true,
                            :format => { :with => email_regex}
  
  validates :numero_siret,   :presence => true,
                            :length => {:is => 14} ,
                            :format => { :with => /[0-9]/ }
  
  validates :domaine_activite, :presence => true,
                              :length => { :maximum => 50 }
  
  validates :code_ape,       :presence => true,
                            :length   =>  {:is => 5 }
                            
  validates :capital_societe,  :presence => true,
                              :length => { :maximum => 50 },
                              :format => { :with => /[0-9]/ }
  
  validates :forme_societe,  :presence => true
  
  validates :code_siren,     :presence => true,
                            :format => { :with => /[0-9]/},
                            :length => {:is => 9}
                            
  validates :code_rcs,       :presence => true,
                            :length => { :maximum => 50}
  
                    
# Crée automatique l'attribut virtuel 'password_confirmation'.
   validates :password, :presence     => true,
                        :confirmation => true,
                        :length       => { :within => 6..40 }
                        
   before_save :encrypt_password

      # Retour true (vrai) si le mot de passe correspond.
      def has_password?(password_soumis)
        # Compare encrypted_password avec la version cryptée de
        # password_soumis.
          encrypted_password == encrypt(password_soumis)
      end
      
      def self.authenticate(email, submitted_password)
         user = find_by_email(email)
         return nil  if user.nil?
         return user if user.has_password?(submitted_password)
      end
      
      def self.authenticate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        (user && user.salt == cookie_salt) ? user : nil
      end
      
      private

          def encrypt_password
            self.salt = make_salt if new_record?
            self.encrypted_password = encrypt(password)
          end

          def encrypt(string)
            secure_hash("#{salt}--#{string}")
          end

          def make_salt
            secure_hash("#{Time.now.utc}--#{password}")
          end

          def secure_hash(string)
            Digest::SHA2.hexdigest(string)
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

