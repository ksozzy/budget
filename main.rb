$LOAD_PATH << "#{File.dirname(__FILE__)}/lib"
require 'sdk'
require_relative 'src/apis'
require_relative 'src/assistant_helper'
require 'Qt'


module AIOffice_Budget
  
  class MainApp < KSO_SDK::App
  
    def onCreate(context)
      if @web.nil?
        @web = KSO_SDK::View::WebViewWidget.new(context)
        @web.showUrl(File.dirname(__FILE__) + '\web\index.html')
        @web.registerJsApi(Sample.new())
      end
      setContentWidget(@web)
    end

    def canRun()
	  return true
    end

  end
  
  AssistantHelper::regAssistant()
  KSO_SDK.start(dir:File.dirname(__FILE__), page: MainApp)
end