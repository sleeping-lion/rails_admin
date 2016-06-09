class AdminAbility
  include CanCan::Ability
  def initialize(admin)
    if admin
      if admin.role? :administrator
        can :manage, :all
      elsif admin.role? :operator
        can :manage, :all
        cannot :delete, [AdType,AdFileType,AdLog,AdLogType,Address,AddressSection,Bank,Target,TargetType,PointType,RequestSetting,RequestType,GameSetting,StoreGood]
        cannot :read, [Operator]
      elsif admin.role? :sub_operator
        can :read, :all
        can :update,  [Ad,AdType,AdFileType,AdLogType,Address,AddressSection,Bank,Request,Target,TargetType,PointType,RequestSetting,RequestType,StoreGood,Sponsor,User]
        cannot :read, [Operator,ApplicationVersion,GameSetting]
      elsif admin.role? :ad_manager
        can :manage, [Ad,AdSchedule,AdState,AdOption,AdMemo,AdFileType,AdFile,Sponsor,AdTarget,AdTargetAddress,AdTargetCid]
        cannot :read, [Operator,ApplicationVersion,GameSetting]
      elsif admin.role? :store_manager
        can :manage, [StoreGood,StoreOrder,StoreGoodPicture]
        cannot :read, [Operator,AppVersion,GameSetting]
      elsif admin.role? :cs_manager
        can :read,[User,UserLoginLog,Point,Request,Message]
      elsif admin.role? :reader
        can :read, :all
        cannot :read, [Operator]
      elsif admin.role? :sponsor
        can :read, [Stat]
        cannot :read, [Operator,AppVersion]
      end
    else
      cannot :manage, :all
    end
  end
end