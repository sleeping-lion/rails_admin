# encoding: utf-8

class SmsMessage < ActiveRecord::Base
  attr_accessible :msg_callback, :msg_charset, :msg_lasttime, :msg_phone, :msg_priority, :msg_rsltcode, :msg_rslttime, :msg_sendtime, :msg_status, :msg_text

  def self.next_message_to_send
    SmsMessage.first(:conditions => ["msg_rslttime IS NULL AND msg_sendtime <= ?", Time.now.utc], :order => "id DESC")
  end
  
  def send
    RestClient.get 'http://sdk4report.eucp.b2m.cn:8080/sdkproxy/sendsms.action?cdkey=0SDK-EAA-6688-JETPK&password=988939&phone=15698103274&message=你好'
    update_attribute(:msg_rslttime, Time.now)
  end
end
