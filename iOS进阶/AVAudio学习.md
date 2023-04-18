# AVAudio 学习
## AVAudioSessionCategory介绍
AVAudioSessionCategory是iOS中管理音频会话类别的类。它主要用于指定当前的音频会话模式,控制音频输入和输出行为。主要有以下几种类别:
1. AVAudioSessionCategoryAmbient:后台音频,用于播放背景音乐等,可以被其他音频打断。
2. AVAudioSessionCategorySoloAmbient:后台音频,不会被其他音频打断。用于播放需要连续不断音频的app,如导航app。
3. AVAudioSessionCategoryPlayback:播放音频,可以从麦克风或其他输入捕获音频数据。用于播放音乐、播客等,可以被打断。
4. AVAudioSessionCategoryRecord:录音,允许使用麦克风输入并捕获音频数据。用于语音识别、视频拍摄等录音场景。
5. AVAudioSessionCategoryPlayAndRecord:同时播放和录音。用于连麦或视频聊天等同时需要播放和录音的场景。
6. AVAudioSessionCategoryMultiRoute:多个入口和出口,需要手动控制不同入出口的音量和是否闭塞。复杂的音频路由场景使用。

除此之外,还有一些重要的方法:
- setActive:激活/取消激活一个音频会话。
- setPreferredInput/Output:设置会话的输入/输出设备首选项。
- overrideOutputAudioPort:覆盖会话的输出端口。
- requestRecordPermission:申请录音权限。

AVAudioSession是一个比较底层的框架,理解各个类别的区别和使用场景,熟练使用其提供的API可以实现复杂的音频控制与管理。
## AVAudioSessionCategoryOption介绍
AVAudioSessionCategoryOption是AVAudioSessionCategory的扩展,用于指定音频会话的附加选项。它主要包含以下几个值:
1. AVAudioSessionCategoryOptionMixWithOthers:允许音频与其他现有音频混合。默认情况下,激活一个新音频会话时,其他正在播放的音频会被停止。设置这个选项可以与其他音频混合播放。
2. AVAudioSessionCategoryOptionDuckOthers:激活音频会话时,降低其他音频的音量。用于需要在播放通知音或短促音效的同时不完全打断其他音频的场景。
3. AVAudioSessionCategoryOptionAllowBluetooth:允许与蓝牙设备进行音频路由。默认情况下,AVAudioSession不与蓝牙设备交互以避免意外的音频中断。设置此选项可以手动管理与蓝牙设备的互动。
4. AVAudioSessionCategoryOptionDefaultToSpeaker:设置默认音频输出方式为扬声器。在连接有线耳机后,音频依然从扬声器输出。
5. AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers:激活音频会话时,允许混合其他音频的同时打断任何正在播放的语音音频。也就是说,设置这个选项,会有以下两种效果:
    1. 可以与其他非语音音频混合播放。比如可以与正在播放的背景音乐混合,两个音频同时播放。
    2. 但会打断任何正在播放的语音音频,如通话,导航语音指令等。这些语音音频会被暂停以优先播放新激活的音频会话。

    这个选项通常用于以下场景:
    * 播放通知音效:需要可以与其他音乐混合播放,但要打断语音音频以提醒用户。
    * 播放短促的语音提示:需要可以与其他音乐混合,但为了清晰播放语音提示需要暂停其他语音流。

    使用方式很简单,在设置音频会话类别和选项时,将其作为选项之一:
    ```AVAudioSessionCategoryOptions options = 
        AVAudioSessionCategoryOptionMixWithOthers |
        AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback 
                                            mode:AVAudioSessionModeDefault 
                                     options:options 
                               withActivationBlock:^{  
                                    // 会话激活后操作  
                                }
    ];
    ```
6. AVAudioSessionCategoryOptionAllowBluetoothA2DP:允许与蓝牙A2DP设备进行音频路由。
    A2DP是蓝牙的高级音频分发配置文件(Advanced Audio Distribution Profile)。它定义了如何在蓝牙设备之间传输立体声音频内容。
    设置这个选项,表示允许当前的音频会话与支持A2DP的蓝牙设备进行音频传输,比如蓝牙耳机、扬声器等。
    默认情况下,AVAudioSession不会与蓝牙设备交互,以防止意外的音频中断。如果需要通过蓝牙A2DP设备输出音频,需要手动设置这个选项。
    使用方式:
    ```
    AVAudioSessionCategoryOptions options = AVAudioSessionCategoryOptionAllowBluetoothA2DP;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback  
                                            mode:AVAudioSessionModeDefault 
                                     options:options 
                               withActivationBlock:^{  
                                    // 会话激活后操作  
                                }
    ]; 
    ```
    设置这个选项后,音频会输出到蓝牙A2DP设备,会话激活块中的操作也会在蓝牙设备准备就绪后执行。
    需要注意的是,并非所有的蓝牙设备都支持A2DP配置文件,只有支持A2DP的蓝牙设备才能作为这个音频会话的输出设备。
7. AVAudioSessionCategoryOptionAllowAirPlay:允许将当前音频会话的输出路由到AirPlay设备,比如Apple TV。
    AirPlay是Apple的一项技术,可以将音频、视频和照片无线发送到Apple TV或兼容的扬声器。
    设置这个选项,表示允许通过AirPlay与支持的设备进行音频路由和输出。默认情况下,AVAudioSession也不会与AirPlay设备交互。
    使用方式:
    ```
    AVAudioSessionCategoryOptions options = AVAudioSessionCategoryOptionAllowAirPlay;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback  
                                            mode:AVAudioSessionModeDefault 
                                     options:options 
                               withActivationBlock:^{  
                                    // 会话激活后操作  
                                } 
    ];
   ```
    设置后,音频会输出到当前可用的AirPlay设备,比如Apple TV。激活块中的代码也会在AirPlay设备准备就绪后执行。
    需要注意:
    1. 并非所有的AirPlay设备都支持音频输出,只有音频输出功能的AirPlay设备才能作为这个音频会话的输出设备。
    2. 播放出去的音频内容可能会在网络传输的过程中丢失一定质量。
    3. AirPlay必须与支持AirPlay的设备在同一个Wi-Fi网络下才能使用。
    所以理解这个选项的作用,可以让我们的App支持无线音频输出到AirPlay设备,为用户提供更完整的体验。但也需要权衡音质与延迟等因素,根据场景选择最佳方案。
8. AVAudioSessionCategoryOptionOverrideMutedMicrophoneInterruption:覆盖静音状态下的麦克风中断。
    也就是说,默认情况下,当iPhone处于锁屏或静音状态时,AVAudioSession会停止录音以避免录到不必要的声音。
    设置这个选项后,即使在锁屏或静音状态下,音频会话也会继续录音,而不会被中断。
    这个选项一般用于以下场景:
    1. 需要在后台录音的VoIP或通话应用。这些应用即使在锁屏状态也需要持续录音,所以需要设置这个选项。
    2. 需要进行长时间录音的录音应用。如果默认行为不设置这个选项,录音会在锁屏时被中断,无法进行长时间录音。
    3. 其他需要在静音状态下继续录音的场景。
    
    使用方式:
    在设置音频会话类型时,将AVAudioSessionCategoryOptionOverrideMutedMicrophoneInterruption作为选项之一:
    ```
    AVAudioSessionCategoryOptions options = AVAudioSessionCategoryOptionOverrideMutedMicrophoneInterruption; 
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryRecord  
                                            mode:AVAudioSessionModeDefault 
                                     options:options 
                               withActivationBlock:^{  
                                    // 会话激活后操作  
                                } 
    ];
    ```
设置这个选项后,无论静音/锁屏状态如何,录音会一直持续。但需要注意,其他的录音提示(录音开始/停止等)也不会展示,这一点开发者需要自行在app内处理。
    理解这个选项的作用,可以让录音类app实现更加强大的功能,满足复杂的需求。但也需要开发者在使用时多加注意,避免出现意外情况。
除了以上这些预定义的选项,还可以使用AVAudioSessionCategoryOptions将多个选项组合使用,例如:
```
AVAudioSessionCategoryOptions options = 
    AVAudioSessionCategoryOptionMixWithOthers | 
    AVAudioSessionCategoryOptionAllowBluetooth;
[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback 
                                        mode:AVAudioSessionModeDefault 
                                 options:options 
                           withActivationBlock:^{ 
                                // 会话激活后执行的操作 
                            } 
];
```
这些选项的使用可以实现更细粒度的音频会话控制,覆盖某些默认设置或设置多个选项的组合效果。熟练使用这些选项可以实现比较高级的音频管理需求。
