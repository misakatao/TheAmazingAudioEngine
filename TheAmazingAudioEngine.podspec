Pod::Spec.new do |s|
  s.name         = "TheAmazingAudioEngine"
  s.version      = "1.5.8"
  s.summary      = "Core Audio, Cordially: A sophisticated framework for iOS audio applications, built so you don't have to."
  s.homepage     = "http://theamazingaudioengine.com"
  s.license      = 'zlib'
  s.author       = { "Michael Tyson" => "michael@atastypixel.com" }
  s.source       = { :git => "https://github.com/TheAmazingAudioEngine/TheAmazingAudioEngine.git", :tag => "1.5.8" }
  s.deprecated   = true
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.source_files = 'TheAmazingAudioEngine/**/*.{h,m,c}', 'Modules/**/*.{h,m,c}'
  s.exclude_files = 'Modules/TPCircularBuffer', 'TheAmazingAudioEngine/AERealtimeWatchdog*'
  s.osx.exclude_files = 'Modules/Filters/AEReverbFilter.*'
  s.compiler_flags = '-DTPCircularBuffer=AECB',
					'-D_TPCircularBufferInit=_AECBInit',
					'-DTPCircularBufferCleanup=AECBClean',
					'-DTPCircularBufferClear=AECBClear',
					'-DTPCircularBufferSetAtomic=AECBSetAtomic',
					'-DTPCircularBufferTail=AECBTail',
					'-DTPCircularBufferConsume=AECBConsume',
					'-DTPCircularBufferHead=AECBHead',
					'-DTPCircularBufferProduce=AECBProduce',
					'-DTPCircularBufferProduceBytes=AECBProduceBytes',
					'-DTPCircularBufferPrepareEmptyAudioBufferList=AECBPrepareEmptyBL',
					'-DTPCircularBufferPrepareEmptyAudioBufferListWithAudioFormat=AECBPrepareEmptyBLWithAF',
					'-DTPCircularBufferProduceAudioBufferList=AECBProduceBL',
					'-DTPCircularBufferCopyAudioBufferList=AECBCopyBL',
					'-DTPCircularBufferNextBufferList=AECBNextBL',
					'-DTPCircularBufferNextBufferListAfter=AECBNextBLAfter',
					'-DTPCircularBufferConsumeNextBufferList=AECBConsumeBL',
					'-DTPCircularBufferGetAvailableSpace=AECBGetAvailableSpace',
					'-DTPCircularBufferConsumeNextBufferListPartial=AECBConsumeBLPartial',
					'-DTPCircularBufferDequeueBufferListFrames=AECBDequeueBLFrames',
					'-DTPCircularBufferPeek=AECBPeek',
					'-DTPCircularBufferPeekContiguous=AECBPeekContiguous',
					'-D_TPCircularBufferPeek=_AECBPeek'
  s.frameworks = 'AudioToolbox', 'Accelerate'
  s.requires_arc = true

  s.header_mappings_dir = 'TheAmazingAudioEngine/Library/TPCircularBuffer'
  src_root = '$(PODS_ROOT)/#{s.name}'
  
  s.pod_target_xcconfig = {
	'DEFINES_MODULE' => 'YES',
	
	'GRPC_SRC_ROOT' => src_root,
	'HEADER_SEARCH_PATHS' => '"$(inherited)" "$(GRPC_SRC_ROOT)"',
	'USER_HEADER_SEARCH_PATHS' => '"$(GRPC_SRC_ROOT)"',
	'USE_HEADERMAP' => 'NO',


	# 'HEADER_SEARCH_PATHS' => header_search_paths.map{ |path| 
	# 	"${PODS_ROOT}/#{s.name}/#{path} #{File.dirname(__FILE__)}/#{path} ${PODS_ROOT}/../../../#{path}"
	# }.join(' '), # 正常路径，本地调试路径，当前Demo的相对路径
    
	# 'SYSTEM_HEADER_SEARCH_PATHS' => header_search_paths.map{ |path| 
	# 	"${PODS_ROOT}/#{s.name}/#{path} #{File.dirname(__FILE__)}/#{path} ${PODS_ROOT}/../../../#{path}"
	# }.join(' '),

	# 'USER_HEADER_SEARCH_PATHS' => header_search_paths.map{ |path| 
	# 	"${PODS_ROOT}/#{s.name}/#{path} #{File.dirname(__FILE__)}/#{path} ${PODS_ROOT}/../../../#{path}"
	# }.join(' '),
  }
  
end
