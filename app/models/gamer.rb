class Gamer < ApplicationRecord

    #db relations

    has_many :invite_requests
    has_many :invites, through: :invite_requests



    attr_accessor :remember_token,:activation_token, :reset_token  # aggiunge attributo alla classe Gamer
    before_create :create_activation_digest





    #attr_accessor :username, :email, :password, :password_confirmation    già lo fa da solo

    before_save { self.email = email.downcase }


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :username, length: {minimum: 6},
                         presence: true #ATTENZIONE AGLI ERRORI COMPILA SEMPRE PER OGNI COSA SCRITTA PERCHE QUI NON AVEVO MESSO  ':' E MI RICHIAMAVA UN ALTRA PAGINA
    validates :email, length:{maximum:255},
                      presence: true,
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    #validates_confirmation_of :password


    #roles
    enum role: [:casual, :pro, :leader, :admin]




    # Returns the hash digest of the given string.
    def Gamer.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def Gamer.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = Gamer.new_token
        update_attribute(:remember_digest, Gamer.digest(remember_token))
    end

    def generate_attributes_token
        self.attributes_token= Gamer.new_token
        Gamer.digest(remember_token)
    end


    # Returns true if the given token matches the digest.


    def authenticated?(attribute ,token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)    #remeber_token variabile locale non della classe
    end   #remeber digest riprende l'attributo interno al db aggiunto

    def forget
        update_attribute(:remember_digest, nil)
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = Gamer.new_token
      self.activation_digest = Gamer.digest(activation_token)
    end

        # Activates an account.
      def activate
        update_attribute(:activated,    true)
        update_attribute(:activated_at, Time.zone.now)
      end

      # Sends activation email.
      def send_activation_email
        GamerMailer.account_activation(self).deliver_now
      end

      # Sets the password reset attributes.

    def create_reset_digest
      self.reset_token = Gamer.new_token
      update_attribute(:reset_digest,  Gamer.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
    end

     # Sends password reset email.
     def send_password_reset_email
       GamerMailer.password_reset(self).deliver_now
     end


     # Returns true if a password reset has expired.
     def password_reset_expired?
       reset_sent_at < 2.hours.ago
     end

    def self.signin_from_auth(auth)

      find_by(email: auth['info']['email']) || create_from_auth(auth)
    end

    def self.create_from_auth(auth)
      where(email: auth.info.email).first_or_initialize do |gamer|
        gamer.username = auth.info.name
        gamer.email = auth.info.email
        gamer.password= Gamer.digest(Gamer.new_token) #get a random password and encrypt
        gamer.activate
        gamer.save!
      end
    end


    def set_false_verification
        update_attribute(:verify_changes,false)
    end




end





#Gamer.create(username: "Michael Hartl", email: "mhartl@example.com",password: "foobar", password_confirmation: "foobar")
