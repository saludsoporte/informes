class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||=User.new
    #Rails.logger.debug "dasdasdasdas "+user.id.to_s
    #alias_action :create, :read, :update, :to => :cru
    alias_action :create, :read, to: :cr
    alias_action :read, :edit, to: :re
    can :read, InformeGeneral
    can :cr ,Perfil     

    @perfiles=Perfil.where(user_id:user.id)
    unless @perfiles.nil?
      #case @perfiles..to_h
       # when 
      #end   
      array=Array.new
      @perfiles.each { |x| array.push(x.rol.nombre)}
      
      if array.include?("admin")         #can :manage,  Articulo        
        can :manage, :all
      end  
      if array.include?("operador")
        can :cr ,InformeGeneral                
        can :re , User
        can :read, Perfil
      end
      if array.include?("general")
        can :cr, InformeGeneral
      end
      if array.include?("director")
        can :manage, InformeGeneral
      end      
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
