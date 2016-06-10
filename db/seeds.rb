# encoding: utf-8

Admin.create(:id=>1,:login_id=>'toughjjh',:email => 'toughjjh@gmail.com',:nickname=>'잠자는-사자',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>2,:login_id=>'admin',:email => 'jpark@myseven.co.kr',:nickname=>'Jon Doe',:password => '111111', :password_confirmation => '111111',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>3,:parent_id=>2,:login_id=>'admin2',:email => 'jpark1@myseven.co.kr',:nickname=>'Jon Doe1',:password => '111111', :password_confirmation => '111111',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>4,:parent_id=>2,:login_id=>'operator',:email => 'jpark2@myseven.co.kr',:nickname=>'Operator',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>5,:parent_id=>2,:login_id=>'sub_operator',:email => 'jpark5@myseven.co.kr',:nickname=>'SubOperator',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>6,:parent_id=>2,:login_id=>'reader',:email => 'jpark4@myseven.co.kr',:nickname=>'Reader',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>7,:parent_id=>2,:login_id=>'sponsor',:email => 'jpark6@myseven.co.kr',:nickname=>'Sponsor',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>8,:parent_id=>2,:login_id=>'ad_manager',:email => 'jpark4@mysrheven.co.kr',:nickname=>'ad_manager',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>9,:parent_id=>2,:login_id=>'store_manager',:email => 'jpark6@myserheven.co.kr',:nickname=>'store_manager',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>10,:parent_id=>2,:login_id=>'cs_manager',:email => 'jpark6@myserhevwegen.co.kr',:nickname=>'cs',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))

Role.create(:id=>1,:title=>'administrator',:flag=>false)
Role.create(:id=>2,:title=>'operator')
Role.create(:id=>3,:title=>'sub_operator')
Role.create(:id=>4,:title=>'reader')
Role.create(:id=>5,:title=>'sponsor')
Role.create(:id=>6,:title=>'ad_manager')
Role.create(:id=>7,:title=>'store_manager')
Role.create(:id=>8,:title=>'cs_manager')

RolesAdmin.create(:role_id=>1,:admin_id=>1)
RolesAdmin.create(:role_id=>1,:admin_id=>2)
RolesAdmin.create(:role_id=>1,:admin_id=>3)
RolesAdmin.create(:role_id=>2,:admin_id=>4)
RolesAdmin.create(:role_id=>3,:admin_id=>5)
RolesAdmin.create(:role_id=>4,:admin_id=>6)
RolesAdmin.create(:role_id=>5,:admin_id=>7)
RolesAdmin.create(:role_id=>6,:admin_id=>8)
RolesAdmin.create(:role_id=>7,:admin_id=>9)
RolesAdmin.create(:role_id=>8,:admin_id=>10)

User.create(:id=>1,:username=>'user1',:email => 'toughjjh@gmail1.com',:nickname=>'잠자는-사자1',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>2,:username=>'user2',:email => 'toughjjh@gmail2.com',:nickname=>'잠자는-사자2',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>3,:username=>'user3',:email => 'toughjjh@gmail3.com',:nickname=>'잠자는-사자3',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>4,:username=>'user4',:email => 'toughjjh@gmail4.com',:nickname=>'잠자는-사자4',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>5,:username=>'user5',:email => 'toughjjh@gmail5.com',:nickname=>'잠자는-사자5',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>6,:username=>'user6',:email => 'toughjjh@gmail6.com',:nickname=>'잠자는-사자6',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>7,:username=>'elandor',:email => 'elandor@nate.com',:nickname=>'안대식',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15214346349',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>8,:username=>'ccstest',:email => 'ccsccs1004@nate.com',:nickname=>'최철승',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15214347041',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>9,:username=>'yjkim',:email => 'yjkim@myseven.co.kr',:nickname=>'김테스트',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15800406171',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>10,:username=>'user10',:email => 'toughjjh@gmai24l1.com',:nickname=>'잠자는-사자14',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>11,:username=>'user25',:email => 'toughjjh@g235mail2.com',:nickname=>'잠자는-사자2t',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>12,:username=>'user3t',:email => 'toughjjh@gm25ail3.com',:nickname=>'잠자는-사자3t',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>13,:username=>'user4h',:email => 'toughjjh@g325mail4.com',:nickname=>'잠자는-사자43',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>14,:username=>'user5r',:email => 'toughjjh@g325mail5.com',:nickname=>'잠자는-사자5e',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>15,:username=>'user6e',:email => 'toughjjh@g235mail6.com',:nickname=>'잠자는-사자6e',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>16,:username=>'elandohhr',:email => 'elando35r@nate.com',:nickname=>'안대gg식',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15214346349',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>17,:username=>'ccstestr',:email => 'ccsccs2351004@nate.com',:nickname=>'최철ea승',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15214347041',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>18,:username=>'yjkimnn',:email => 'yjkim@253myseven.co.kr',:nickname=>'김테스awe트',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15800406171',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>19,:username=>'user1hs',:email => 'toughj325jh@gmail1.com',:nickname=>'잠자는-사we자1',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>20,:username=>'user2serh',:email => 'tou325ghjjh@gmail2.com',:nickname=>'잠자는-사aweg자2',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>21,:username=>'user3e',:email => 'tough235jjh@gmail3.com',:nickname=>'잠자는-사자awe3',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>20000, :coupon=>20000, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>22,:username=>'user4ree',:email => 'tou25235ghjjh@gmail4.com',:nickname=>'잠자는-사awg자4',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>23,:username=>'user5see',:email => 'to235ughjjh@gmail5.com',:nickname=>'잠awge자는-사자5',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>24,:username=>'user6nn',:email => 'tou235ghjjh@gmail6.com',:nickname=>'잠자는-aweg사자6',:password => '123456', :password_confirmation => '123456', :nation_num=>'82', :mobile_num=>'010-4141-3726',:point=>0, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>25,:username=>'elandorehs',:email => 'el352andor@nate.com',:nickname=>'안aweg대식',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15214346349',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>26,:username=>'ccstestsdh',:email => 'ccsc325cs1004@nate.com',:nickname=>'최철aweg승',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15214347041',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')
User.create(:id=>27,:username=>'yjkiserhseddddm',:email => 'yjk325235im@myseven.co.kr',:nickname=>'김wega테스트',:password => '123456', :password_confirmation => '123456',:nation_num=>'86', :mobile_num=>'15800406171',:point=>100000, :coupon=>0, :device_id=>'awegweg', :service_provider=>'010111')


user7=User.find(7)
user7.update_attributes(:encrypted_password=>'99d162d1c60875bd6c3b4bcc6e3002217672f49b',:salt=>'YQhgDeM05f')

user8=User.find(8)
user8.update_attributes(:encrypted_password=>'8a8516d931f33dc3419ce230e1b48e75f0c4e5b5', :salt=>'hHL2jRRWfi')

user9=User.find(9)
user9.update_attributes(:encrypted_password=>'43b6442c0f6a0a4f050c61f7d8d9951cb10dd293', :salt=>'tYTomgwyhl')

DeleteUser.create(:id=>1,:username=>'delete_user1',:email => 'toughjjh@gmail1.com',:nickname=>'탈퇴한 잠자는-사자1', :nation_num=>'82', :mobile_num=>'010-4141-3726')
DeleteUser.create(:id=>2,:username=>'delete_user2',:email => 'toughjjh@gmail2.com',:nickname=>'탈퇴한 잠자는-사자2', :nation_num=>'82', :mobile_num=>'010-4141-3726')
DeleteUser.create(:id=>3,:username=>'delete_user3',:email => 'toughjjh@gmail3.com',:nickname=>'탈퇴한 잠자는-사자3', :nation_num=>'82', :mobile_num=>'010-4141-3726')
DeleteUser.create(:id=>4,:username=>'delete_user4',:email => 'toughjjh@gmail4.com',:nickname=>'탈퇴한 잠자는-사자4', :nation_num=>'82', :mobile_num=>'010-4141-3726')
DeleteUser.create(:id=>5,:username=>'delete_user5',:email => 'toughjjh@gmail5.com',:nickname=>'탈퇴한 잠자는-사자5', :nation_num=>'82', :mobile_num=>'010-4141-3726')
DeleteUser.create(:id=>6,:username=>'delete_user6',:email => 'toughjjh@gmail6.com',:nickname=>'탈퇴한 잠자는-사자6',  :nation_num=>'82', :mobile_num=>'010-4141-3726')


=begin  In China
Bank.create(:bank_code=>'04',:name=>'국민은행')
Bank.create(:bank_code=>'20',:name=>'우리은행')
Bank.create(:bank_code=>'88',:name=>'신한은행')
Bank.create(:bank_code=>'81',:name=>'하나은행')
Bank.create(:bank_code=>'11',:name=>'농협중앙')
Bank.create(:bank_code=>'05',:name=>'외환은행')
Bank.create(:bank_code=>'03',:name=>'기업은행')
Bank.create(:bank_code=>'23',:name=>'SC제일은행')
Bank.create(:bank_code=>'27',:name=>'시티은행')
Bank.create(:bank_code=>'54',:name=>'HSBC')
Bank.create(:bank_code=>'02',:name=>'산업은행')
Bank.create(:bank_code=>'07',:name=>'수협중앙회')
Bank.create(:bank_code=>'71',:name=>'우체국')
Bank.create(:bank_code=>'12',:name=>'단위농협')
Bank.create(:bank_code=>'32',:name=>'부산은행')
Bank.create(:bank_code=>'37',:name=>'전북은행')
Bank.create(:bank_code=>'36',:name=>'경남은행')
Bank.create(:bank_code=>'34',:name=>'광주은행')
Bank.create(:bank_code=>'31',:name=>'대구은행')
Bank.create(:bank_code=>'35',:name=>'제주은행')
Bank.create(:bank_code=>'45',:name=>'새마을금고')
Bank.create(:bank_code=>'48',:name=>'신협')
=end

Bank.create(:name=>'China Mobile')
Bank.create(:name=>'China Unicom')
Bank.create(:name=>'China Telecom')
Bank.create(:name=>'기타')

AppMarket.create(:title=>'구글 플레이스토어')

RequestType.create(:title=>'신청완료')
RequestType.create(:title=>'처리완료')

RequestSetting.create(:title=>'1000 point - 1000won', :amount=>1000)
RequestSetting.create(:title=>'2000 point - 2000won', :amount=>2000)
RequestSetting.create(:title=>'4000 point - 4000won', :amount=>4000)
RequestSetting.create(:title=>'5000 point - 5000won', :amount=>5000)
RequestSetting.create(:title=>'10000 point - 10000won', :amount=>10000)

AdType.create(:title=>'배너광고' ,:file_prefix=>'ad_banner',:max_file_count=>1)
AdType.create(:title=>'전화광고' ,:file_prefix=>'ad_call',:max_file_count=>3)
AdType.create(:title=>'전면광고' ,:file_prefix=>'ad_front',:max_file_count=>2)
AdType.create(:title=>'App광고' ,:file_prefix=>'ad_list',:max_file_count=>2)

Sponsor.create(:title=>'스폰서1')
Sponsor.create(:title=>'스폰서2')

PointType.create(:id=>1,:title=>'회원가입',:amount=>10)
PointType.create(:id=>2,:title=>'회원추천',:amount=>10)
PointType.create(:id=>3,:title=>'회원추천받음',:amount=>30)
PointType.create(:id=>4,:title=>'설문조사참여',:amount=>20)
PointType.create(:id=>5,:title=>'게임실행',:amount=>-3)
PointType.create(:id=>6,:title=>'게임당첨',:amount=>5)
PointType.create(:id=>7,:title=>'현금전환',:amount=>50)
PointType.create(:id=>8,:title=>'전화광고보기',:amount=>1)
PointType.create(:id=>9,:title=>'app다운',:amount=>20)
PointType.create(:id => 15, :title=>'이메일입력',:amount=>1)
PointType.create(:id => 16, :title=>'주소입력',:amount=>1)
PointType.create(:id => 17, :title=>'설문조사1',:amount=>1)
PointType.create(:id => 18, :title=>'설문조사2',:amount=>1)
PointType.create(:id => 19, :title=>'설문조사3',:amount=>1)
PointType.create(:id => 20, :title=>'설문조사4',:amount=>1)
PointType.create(:id => 21, :title=>'설문조사5',:amount=>1)
PointType.create(:id => 22, :title=>'설문조사6',:amount=>1)
PointType.create(:id => 23, :title=>'설문조사7',:amount=>1)
PointType.create(:id => 24, :title=>'사진 수정',:amount=>1)
PointType.create(:id => 25, :title=>'전화번호 입력',:amount=>1)

# in China  PointType.create(:id=>4,:title=>'쿠폰변환',:amount=>-5000)
=begin
PointsCouponsSetting.create(:point=>500,:coupon=>1000,:flag=>true)
PointsCouponsSetting.create(:point=>2500,:coupon=>5000,:flag=>true)
PointsCouponsSetting.create(:point=>5000,:coupon=>10500,:flag=>true)
PointsCouponsSetting.create(:point=>8000,:coupon=>17000,:flag=>true)
PointsCouponsSetting.create(:point=>10000,:coupon=>22000,:flag=>true)
PointsCouponsSetting.create(:point=>20000,:coupon=>45000,:flag=>true)
PointsCouponsSetting.create(:point=>30000,:coupon=>69000,:flag=>true)
PointsCouponsSetting.create(:point=>40000,:coupon=>94000,:flag=>true)
PointsCouponsSetting.create(:point=>50000,:coupon=>120000,:flag=>true)

CouponType.create(:title=>'포인트변환',:amount=>5000)
CouponType.create(:title=>'게임실행',:amount=>-5)
CouponType.create(:title=>'광고보기',:amount=>10)
CouponType.create(:title=>'댓글보기',:amount=>10)
CouponType.create(:title=>'FB연결',:amount=>10)
CouponType.create(:title=>'웹이동',:amount=>10)
=end

TargetType.create(:id=>1,:title=>"관심분야")
TargetType.create(:id=>2,:title=>"직업")
TargetType.create(:id=>3,:title=>"성별")
TargetType.create(:id=>4,:title=>"결혼유무")
TargetType.create(:id=>5,:title=>"연령대")
TargetType.create(:id=>6,:title=>"차량")

Target.create(:target_type_id=>1, :title=>'게임, 스포츠')
Target.create(:target_type_id=>1, :title=>'영화,연극')
Target.create(:target_type_id=>1, :title=>'공연,전시')
Target.create(:target_type_id=>1, :title=>'패션,쇼핑')
Target.create(:target_type_id=>1, :title=>'피부,미용')
Target.create(:target_type_id=>1, :title=>'맛집,요리')
Target.create(:target_type_id=>1, :title=>'사진,여행')
Target.create(:target_type_id=>1, :title=>'연예,오락')
Target.create(:target_type_id=>1, :title=>'도서,음악')
Target.create(:target_type_id=>1, :title=>'클럽,이벤트')
Target.create(:target_type_id=>1, :title=>'IT,전자')
Target.create(:target_type_id=>1, :title=>'재테크,투자')
Target.create(:target_type_id=>1, :title=>'취업,스펙')
Target.create(:target_type_id=>1, :title=>'육아,교육')
Target.create(:target_type_id=>1, :title=>'헬스,다이어트')
Target.create(:target_type_id=>1, :title=>'자동차,부동산')

Target.create(:target_type_id=>2, :title=>'농업,임업및어업')
Target.create(:target_type_id=>2, :title=>'광업')
Target.create(:target_type_id=>2, :title=>'제조업')
Target.create(:target_type_id=>2, :title=>'전기,가스,증기및수도사업')
Target.create(:target_type_id=>2, :title=>'하수·폐기물처리,원료재생및환경복원업')
Target.create(:target_type_id=>2, :title=>'건설업')
Target.create(:target_type_id=>2, :title=>'도매및소매업')
Target.create(:target_type_id=>2, :title=>'운수업')
Target.create(:target_type_id=>2, :title=>'숙박및음식점업')
Target.create(:target_type_id=>2, :title=>'출판,영상,방송통신및정보서비스업')
Target.create(:target_type_id=>2, :title=>'금융및보험업')
Target.create(:target_type_id=>2, :title=>'부동산업및임대업')
Target.create(:target_type_id=>2, :title=>'전문,과학및기술서비스업')
Target.create(:target_type_id=>2, :title=>'사업시설관리및사업지원서비스업')
Target.create(:target_type_id=>2, :title=>'공공행정,국방및사회보장행정')
Target.create(:target_type_id=>2, :title=>'교육서비스업')
Target.create(:target_type_id=>2, :title=>'보건업및사회복지서비스업')
Target.create(:target_type_id=>2, :title=>'예술,스포츠및여가관련서비스업')
Target.create(:target_type_id=>2, :title=>'협회및단체,수리 및 기타 개인 서비스업')
Target.create(:target_type_id=>2, :title=>'가구내고용활동및달리분류되지않은자가소비생산활동')

Target.create(:target_type_id=>3, :title=>'남자')
Target.create(:target_type_id=>3, :title=>'여자')

Target.create(:target_type_id=>4, :title=>'기혼')
Target.create(:target_type_id=>4, :title=>'미혼')

Target.create(:target_type_id=>5, :title=>'10대')
Target.create(:target_type_id=>5, :title=>'20대')
Target.create(:target_type_id=>5, :title=>'30대')
Target.create(:target_type_id=>5, :title=>'40대')
Target.create(:target_type_id=>5, :title=>'50대')
Target.create(:target_type_id=>5, :title=>'60대 이상')

Target.create(:target_type_id=>6, :title=>'무소유')
Target.create(:target_type_id=>6, :title=>'자전거')
Target.create(:target_type_id=>6, :title=>'SUV')
Target.create(:target_type_id=>6, :title=>'일반차')
Target.create(:target_type_id=>6, :title=>'수입차')
Target.create(:target_type_id=>6, :title=>'Van')

InternalExchangeRate.create(:rate=>1.0)

Notice.create(:id=>1,:title=>'3')
NoticeContent.create(:id=>1,:content=>'awegawegawegaweg')

Faq.create(:id=>1,:title=>'3')
FaqContent.create(:id=>1,:content=>'awegawegawegaweg')


Address.create(:id=>1, :parent_address_id=>0, :level=>-1, :name=>'지구', :full_address=>'지구', :flag=>false)
Address.create(:id=>2, :parent_address_id=>1, :level=>0, :name=>'대한민국', :full_address=>'대한민국', :flag=>true)
Address.create(:id=>3, :parent_address_id=>1, :level=>0, :name=>'중국', :full_address=>'중국', :flag=>true)
Address.create(:id=>4, :parent_address_id=>2, :level=>1, :name=>'서울', :full_address=>'서울시', :flag=>true)
Address.create(:id=>5, :parent_address_id=>3, :level=>1, :name=>'상해', :full_address=>'상해', :flag=>true)
Address.create(:id=>6, :parent_address_id=>2, :level=>1, :name=>'강남구', :full_address=>'서울시 강남구', :flag=>true)
Address.create(:id=>7, :parent_address_id=>6, :level=>2, :name=>'삼성동', :full_address=>'서울시 강남구 삼성동', :flag=>true)
Address.create(:id=>8, :parent_address_id=>6, :level=>2, :name=>'역삼동', :full_address=>'서울시 강남구 역삼동', :flag=>true)
Address.create(:id=>9, :parent_address_id=>2, :level=>1, :name=>'강남구', :full_address=>'서울시 금천구', :flag=>true)
Address.create(:id=>10, :parent_address_id=>9, :level=>2, :name=>'가산동', :full_address=>'서울시 금천구 가산동', :flag=>true)
Address.create(:id=>11, :parent_address_id=>9, :level=>2, :name=>'독산동', :full_address=>'서울시 금천구 독산동', :flag=>true)

AppVersion.create( :client_version => '58', :version_name=>'gg', :contents=>'gg', :state=>'f', :update_date => '2013-05-31' )

AdLogType.create(:id => 1, :title=>'노출')
AdLogType.create(:id => 2, :title=>'클릭')
AdLogType.create(:id => 3, :title=>'수신')
AdLogType.create(:id => 4, :title=>'발신')
AdLogType.create(:id => 5, :title=>'만료')
AdLogType.create(:id => 6, :title=>'설치')
AdLogType.create(:id => 7, :title=>'웹이동')
AdLogType.create(:id => 8, :title=>'Expose')
AdLogType.create(:id => 9, :title=>'전화접속')

AdFileType.create(:title=>'썸네일')
AdFileType.create(:title=>'광고이미지')
AdFileType.create(:title=>'이미지압축')
AdFileType.create(:title=>'임시파일')

RouletteSetting.create(:title=>'1000포인트',:percentage=>0.01, :amount=>1000, :limit=>1)
RouletteSetting.create(:title=>'100포인트',:percentage=>0.1, :amount=>100, :limit=>2)
RouletteSetting.create(:title=>'50포인트',:percentage=>0.5, :amount=>50, :limit=>5)
RouletteSetting.create(:title=>'10포인트',:percentage=>4.29, :amount=>10, :limit=>0)
RouletteSetting.create(:title=>'5포인트',:percentage=>20, :amount=>5, :limit=>0)
RouletteSetting.create(:title=>'2포인트',:percentage=>35, :amount=>2, :limit=>0)
RouletteSetting.create(:title=>'상품',:percentage=>0.1, :amount=>0, :limit=>1)
RouletteSetting.create(:title=>'연속꽝 보상',:percentage=>0, :amount=>10, :limit=>0)

RoulettePresent.create(:title=>'연속꽝 보상', :photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))

StoreType.create(:title=>'포인트')
StoreType.create(:title=>'쿠폰')

StoreGood.create(:store_type_id=>1,:description_short=>'Short Description', :description=>'Longer Description', :flag=>true, :order_count=>0, :proirity_flag=>0, :hot_flag=>1, :sale_end_time => '2013-12-31 23:59:59', :sale_price => '150', :sale_start_time => '2013-06-01', :sale_type => 'point', :stock_count => '100', :title => 'test product')
