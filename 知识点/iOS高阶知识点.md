## iOS高阶知识点
主要的iOS高阶知识点包括：Core Data、Cocoa Touch、Auto Layout、Grand Central Dispatch、Storyboards、Core Animation、Core Graphics、Core Location、Core Motion、Core Text、Core Image、MapKit等
1. 熟练掌握iOS开发中的Objective-C或Swift语言语法及特性。
2. 了解iOS系统的架构和内部运作机制，例如消息传递、事件响应等。
3. 掌握iOS开发中的网络编程技术，包括socket、HTTP、HTTPS、SSL/TLS等协议和框架。
4. 熟悉iOS开发中的多线程和异步编程模式，并掌握GCD和NSOperationQueue使用。
5. 掌握Core Data技术，了解数据持久化、基于SQLite的关系数据库ORM等相关技术。
6. 熟悉iOS界面开发的基本原理和技术，包括UIKit、Auto Layout等技术。
7. 掌握iOS开发中的动画与图形技术，包括Core Animation、Metal等技术。
8. 了解iOS开发中的常用框架，包括AFNetworking、SDWebImage、Masonry、Alamofire等。
9. 熟悉iOS开发中的推送通知和本地通知实现机制。
10. 掌握iOS开发中的安全性和隐私保护机制，包括Keychain、Touch ID、Face ID等。
11. Swift语言的高级特性，如泛型、协议、闭包等
12. iOS系统的底层知识，如运行时、内存管理、线程和锁等
13. UIKit和Core Animation框架的高级使用，如自定义控件、动画效果、图像处理等
14. 多线程和异步编程的高级技巧，如GCD、NSOperation、信号量等
15. 数据持久化和网络通信的高级实现，如Core Data、Realm、AFNetworking等
16. iOS应用的优化和调试技巧，如Instruments、Leaks工具、Crash日志等
17. 自动化构建和持续集成的高级应用，如Fastlane、Jenkins等
18. ARKit和Core ML等新技术的应用和实现。
## 技能点
1. 熟练掌握iOS开发语言：Swift/Objective-C。深入了解语言的特性、语法、标准库等，能够灵活运用语言进行编程。
2. 掌握iOS开发框架和技术：UIKit、Core Data、Core Animation、Core Graphics、GCD等。了解这些框架和技术的使用方法和原理，能够快速解决开发中遇到的问题。
3. 学习iOS开发工具和环境：Xcode、Interface Builder、Instruments等。熟悉这些工具的使用方法和技巧，能够提高开发效率和代码质量。
4. 学习iOS开发最佳实践：如代码规范、架构设计、测试、性能优化等。遵循最佳实践可以提高代码可读性、可维护性和可扩展性。
5. 学习新技术和趋势：如SwiftUI、ARKit、Core ML等。了解新技术和趋势，能够在开发中使用更加先进的技术和工具，提高产品的竞争力。
1. 精通Objective-C或Swift编程语言
2. 熟悉Xcode开发工具和iOS SDK
3. 熟悉iOS应用程序的架构和设计模式
4. 熟悉iOS应用程序的调试和优化技术
5. 熟悉iOS应用程序的性能优化和内存管理
6. 熟悉iOS应用程序的网络编程和数据存储
7. 熟悉iOS应用程序的UI设计和用户体验
8. 熟悉iOS应用程序的安全性和保护机制
9. 熟悉苹果公司的开发者文档和审核规则
10. 熟悉移动端开发的趋势和发展方向，保持学习和更新。
## 事件响应
iOS的事件响应是指当用户触摸屏幕或进行其他操作时，系统如何响应和处理这些事件。iOS事件响应的基本流程如下：
1. 用户触摸屏幕或进行其他操作，系统将事件传递给应用程序。
2. 应用程序将事件传递给相应的视图对象（如按钮、标签等）。
3. 视图对象通过事件响应链传递事件，直到找到能够处理事件的对象。
4. 处理事件的对象执行相应的操作，如改变视图的状态、执行动画等。
5. 如果事件无法被处理，则会传递给上一级视图对象，直至传递到应用程序的根视图对象。
6. 如果根视图对象也无法处理事件，则事件将被丢弃。

**iOS的事件响应是基于事件响应链的机制，这意味着每个视图对象都有机会处理事件**。在事件响应链中，事件从父视图对象传递到子视图对象，直到找到能够处理事件的对象为止。如果事件无法被处理，则会传递回父视图对象，直至传递到根视图对象或被丢弃。

iOS的事件响应通常遵循以下流程：
1. 系统接收到一个事件（比如触摸屏幕），并将其转化为一个UIEvent实例。
2. UIWindow对象拦截到UIEvent实例，并将其分配给正确的UIView对象。
3. UIView对象通过hitTest:withEvent:方法确定响应事件的最佳视图，并将该事件传递给该视图。
4. 如果视图想要响应事件，则会调用其相应的处理事件方法，比如touchesBegan:withEvent:或touchesMoved:withEvent:等等。
5. 如果视图无法处理该事件，则该事件会传递到视图层次结构中的下一个视图，直到找到可以处理该事件的视图为止。

总体来说，事件响应机制的核心是View，通过查找响应链找到 Event 所在的 View，然后根据 View 的响应事件决定是否处理。在多个视图中，最上层的视图会先收到事件，如果它不处理则会继续把事件传递给下层的视图。
## 消息传递
iOS的消息传递指的是在iOS系统中，不同组件之间通过消息传递来进行通信的方式。iOS的消息传递主要分为两种方式：
1.**通知中心（NSNotificationCenter）**：通知中心提供了一种松散耦合的方式，允许多个对象之间进行通信，并不需要知道彼此的存在。通知中心可以让一个对象发布一个通知，并且可以让其他对象监听这个通知，当这个通知被发布时，监听这个通知的对象会被自动通知到。
2.**代理（Delegate）**：代理是一种紧密耦合的方式，它允许一个对象将任务委托给另一个对象来完成。代理需要定义一个协议（Protocol），并且需要有一个实现了这个协议的对象来作为代理，当需要完成某个任务时，对象会调用代理对象的方法来完成任务。
除了以上两种方式外，iOS还提供了其他的消息传递方式，比如**Block、KVO**等。不同的消息传递方式适用于不同的场景，开发者需要根据实际需求选择适合的方式来进行消息传递。
3.**KVO**：KVO是Key-Value Observing的缩写，是一个Swift和Objective-C的重要特性，它允许在对象的某些属性发生改变时通知观察者。使用KVO模式可以使观察者对象自动地接收来自其他对象属性值的改变通知，而无需主动查询。这种模式常常被用于iOS开发中的MVC架构中，以便让视图能够观察模型数据的变化。使用KVO需要注意内存管理，因为需要在不需要时手动取消观察者。
## KVC
KVC（Key-Value Coding，键值编码）是Objective-C的一种机制，它可以让开发者通过键的名称访问对象的属性，或者是通过键的名称修改对象的属性值。它通过一些预定义方法和约定俗成的命名规范来实现属性访问。
使用KVC的好处在于，可以简化代码，提高灵活性和可扩展性。例如，可以使用KVC来实现一个通用的数据绑定功能，从而省去大量重复的代码。同时KVC也是实现某些功能必不可少的一环，例如实现Core Data等框架。
需要注意的是，在使用KVC时，属性名必须符合一定的规范，例如使用setter/getter方法的名称、属性名称（通常是ivar的名称）以及一些约定俗成的命名规范等。
## 方法调用机制
iOS方法调用机制是指在iOS系统中，调用一个方法时，系统是如何找到这个方法并执行它的过程。以下是iOS方法调用机制的基本流程：
1. **方法调用者发送消息**：方法调用者（例如一个对象）发送一个消息给接收者（另一个对象），请求执行某个方法。
2. **消息转发机制**：如果接收者无法响应该消息，iOS会先执行一系列消息转发机制，包括动态方法解析、备援接收者和完整消息转发，以尝试找到能够响应该消息的对象。
3. **方法查找**：如果消息转发机制失败，iOS会在接收者的方法列表中查找要执行的方法。
4. **方法调用**：找到了要执行的方法后，iOS会将参数和方法名传递给该方法，并执行它。

需要注意的是，**在Objective-C中，方法调用实际上是通过消息发送实现的**，即对象接收到消息后，会根据消息中的方法名找到对应的方法并执行。这种动态绑定的机制使得Objective-C具有很高的灵活性和可扩展性。
## Swift的特性
Swift是一种现代化的、面向对象的编程语言，它具有以下几个特性：
1. 安全性：Swift在语言级别上提供了许多安全特性，如类型检查、内存安全、空值检查等，可以避免常见的编程错误和安全漏洞。
2. 性能：Swift是一种编译型语言，可以生成高效的机器码，同时还提供了许多优化特性，如值类型、延迟计算等，可以提高代码的运行效率。
3. 易读性：Swift的语法简洁、清晰，具有类似自然语言的表达方式，可以提高代码的可读性和可维护性。
4. 交互性：Swift具有REPL（Read-Eval-Print Loop）交互式编程环境，可以快速验证代码的正确性和效果。
5. 多范式：Swift支持面向对象、函数式、协议式等多种编程范式，可以适应不同的编程场景和需求。
6. 开放性：Swift是一种开源语言，拥有庞大的开发者社区和丰富的第三方库，可以快速构建高质量的应用和服务。

总之，Swift是一种现代化、安全、高效、易读、交互、多范式、开放的编程语言，适用于各种应用场景和开发需求。
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
## 动态库和静态库
库（library）是一些代码的集合，可以在程序中反复使用。库分为动态库和静态库两种类型。
静态库（Static Library）是指在编译链接时将库代码的内容全部复制到目标程序中。在程序运行时，所有需要的代码已经存在于目标程序中，因此不再需要库文件的支持，因此静态库的体积较大，但是运行时执行效率高。
动态库（Dynamic Library）则是在程序执行过程中才被载入内存中使用的库文件，因此只有程序中调用了库函数时，相应的函数代码才会被载入内存。相比静态库，动态库的体积较小，但是程序在运行时需要系统加载库文件，因此执行效率相对较低。动态库在Linux系统中使用较为广泛。
动态库和静态库都是编译链接形式,主要区别如下:
动态库:
1. 以.dylib(macOS)或.so(Linux)结尾,在运行时被加载。
2. 编译的时候不会把库的代码合并到可执行文件中,运行的时候才会把库加载到内存中。
3. 可以更新动态库而不用重新编译使用该库的可执行文件。
4. 需要确保用户机器上已经安装了需要的库。
5. 程序启动时加载速度较慢,但减小了可执行文件的体积。

静态库:
1. 以.a结尾,在编译链接阶段被静态包含在可执行文件中。
2. 编译时会把库的代码合并到可执行文件,运行时不再需要单独加载库。
3. 如果库更新需要重新编译使用该库的所有可执行文件。
4. 不依赖于用户环境,程序不需要单独的库支持就可以运行。
5. 程序启动时加载速度较快,但增加了可执行文件的体积。

总结来说:
**动态库:编译快、运行时加载、可以更新库、需要环境支持。
静态库:编译慢、编译时导入、更新需全部重新编译、不需要环境。**
实际开发中会根据情况选择使用动态库还是静态库。比如core library会选用动态库,第三方库为了兼容性会选用静态库。动态库可以减小程序体积和启动时间,但也可能带来compatibility问题。
## Alamofire
Alamofire是一个基于Swift语言的HTTP网络请求库，它简化了iOS应用程序中执行网络请求的过程。Alamofire提供了易于使用的API，可以进行各种HTTP请求，包括GET、POST、PUT、DELETE和PATCH等。它还支持各种参数编码方式和请求头设置，支持使用URL、JSON、NSData和URL-encoded形式的参数，在网络请求过程中还提供了支持认证和安全连接的功能。Alamofire一般需要和SwiftyJSON、ObjectMapper等库一起使用，用来处理返回数据。
## Realm
Realm是一个流行的移动数据库解决方案，可用于iOS，Android和其他移动平台。它提供了一个对象映射器（ORM），可将数据存储在本地设备上的数据库中，并提供了简单的API来查询和更新数据，以及实现数据同步和加密。Realm还提供了一个开放源代码的版本，可在其他环境中使用，如服务器端和桌面应用程序。