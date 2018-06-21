=begin
  #--Created by laiw<laiwei@wps.cn> on 2018/2/12.
  #++Description:
=end

module AssistantHelper

  def self.createRegisterContext()
    map = {:scriptId=>"14", :title=>"高级财务助手", :icon => "icon.png"}

    context = Object.new()
    map.each do |key, val|
      context.define_singleton_method key do
        val
      end
    end
    
    context.define_singleton_method 'to_s' do 
      json.to_s
    end
    context
  
  end

  def self.regAssistant()
    context = createRegisterContext()
    settings = KSO_SDK::Settings.new(context)

    dir = File.dirname(__FILE__) 
    resPath = File.join(dir, "../#{context.scriptId}/res")
    
    settings.write(KSO_SDK::Title, context.title) unless settings.keyExist?(KSO_SDK::Title)
    settings.write(KSO_SDK::ApplicationName, "#{KSO_SDK::getAppType()}") unless settings.keyExist?(KSO_SDK::ApplicationName)
    settings.write(KSO_SDK::Icon, "#{File.join(resPath, context.icon)}") unless settings.keyExist?(KSO_SDK::Icon)
    settings.write(KSO_SDK::IsShowButton, 1) unless settings.keyExist?(KSO_SDK::IsShowButton)
    settings.write(KSO_SDK::RunFirst, false) unless settings.keyExist?(KSO_SDK::RunFirst)
  end
end
