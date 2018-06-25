//
//  HLMusicManager.m
//  HLAVPlayer
//
//  Created by HL on 2017/5/9.
//  Copyright © 2017年 HL. All rights reserved.
//

#import "WBAudioPlayerHelper.h"
#import <UIKit/UIKit.h>

@implementation WBAudioPlayerHelper


#pragma mark - 对象生命
//第二步：实现声明单例方法 GCD
+ (WBAudioPlayerHelper *)shareInstance
{
    static WBAudioPlayerHelper *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[WBAudioPlayerHelper alloc] init];
    });
    return singleton;
}

//初始化-单例，只调用一次
- (id)init {
    self = [super init];
    if (self) {
//        [self changeProximityMonitorEnableState:YES];
//        [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
    }
    return self;
}
//销毁
- (void)dealloc {
//    [self changeProximityMonitorEnableState:NO];
}


#pragma mark - 近距离传感器
/**
 *  改变传感器状态
 *
 *  @param enable 状态改变后是否启动通知
 */
- (void)changeProximityMonitorEnableState:(BOOL)enable {
//    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    if ([UIDevice currentDevice].proximityMonitoringEnabled == YES) {
        if (enable) {
            //添加近距离事件监听，添加前先设置为YES，如果设置完后还是NO的读话，说明当前设备没有近距离传感器
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorStateChange:) name:UIDeviceProximityStateDidChangeNotification object:nil];
        } else {
            //删除近距离事件监听
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:nil];
//            [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
        }
    }
}

/**
 *  传感器状态改变时，接收到通知响应方法
 *
 *  @param notification 通知中心
 */
- (void)sensorStateChange:(NSNotificationCenter *)notification {
    //如果此时手机靠近面部放在耳朵旁，那么声音将通过听筒输出，并将屏幕变暗
    if ([[UIDevice currentDevice] proximityState] == YES) {
        //黑屏 NSLog(@"Device is close to user");
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        
    } else {
        //没黑屏幕  NSLog(@"Device is not close to user");
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        if (!_audioPlayer || !_audioPlayer.isPlaying) {
            //没有播放了，也没有在黑屏状态下，就可以把距离传感器关了
//            [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
        }
    }
}

#pragma mark - 操作Audio
/**
 *  播放网络音频Audio
 *
 *  @param urlPath   网络音频链接路径
 *  @param isPlaying 播放还是暂停，YES：播放，NO：暂停
 */
- (void)managerAudioWithUrlPath:(NSString *)urlPath playOrPause:(BOOL)isPlaying{
    if (isPlaying) {
        [self playAudioWithPath:urlPath whiteStype:WBAudioFileTyle_Network];
    } else {
        [self pausePlayingAudio];
    }
}
/**
 *  播放本地音频Audio
 *
 *  @param localPath 本地音频链接路径
 *  @param isPlaying 播放还是暂停，YES：播放，NO：暂停
 */
- (void)managerAudioWithLocalPath:(NSString *)localPath playOrPause:(BOOL)isPlaying{
    if (isPlaying) {
        [self playAudioWithPath:localPath whiteStype:WBAudioFileTyle_Local];
    } else {
        [self pausePlayingAudio];
    }
}
/**
 *  播放网络音频Audio
 *
 *  @param path   网络音频链接路径
 */
- (void)playAudioWithPath:(NSString *)path whiteStype:(WBAudioFileTyle)type{
    if (path.length > 0) {
        //不随着静音键和屏幕关闭而静音。code by Aevit
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        //上次播放的录音
        if (_pathName && [path isEqualToString:_pathName]) {
            
            if(_audioPlayer.isPlaying){
                [self pausePlayingAudio];
            }else{
                [self playAudio];
            }
            
        } else {//不是上次播放的录音，重新保存播放
            _pathName = path;
            
            if (_audioPlayer) {
                [_audioPlayer stop];
                self.audioPlayer = nil;
            }
            //初始化播放器
//            self.audioPlayer = [self getAudioPlayer:path withStype:type];
//            self.audioPlayer = [self getAudioPlayer:path withStype:type];
            [self getOneAudioPlayer:path withStype:type];
            
        }
    }
}


/**
 *  开始播放
 */
- (void)playAudio {
    if (_audioPlayer) {
        //
        //    UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
        //    //外放
        //
        //    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory, sizeof(sessionCategory), &sessionCategory);
        //
        //    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;//话筒
        //
        //    AudioSessionSetProperty (kAudioSessionProperty_OverrideCategoryDefaultToSpeaker,sizeof (audioRouteOverride),&audioRouteOverride);
        //
        [_audioPlayer play];
//        [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
        if ([self.delegate respondsToSelector:@selector(didAudioPlayerBeginPlay:)]) {
            [self.delegate didAudioPlayerBeginPlay:_audioPlayer];
        }
    }
}
/**
 *  暂停播放
 */
- (void)pausePlayingAudio {
    if (_audioPlayer) {
        [_audioPlayer pause];
        if ([self.delegate respondsToSelector:@selector(didAudioPlayerPausePlay:)]) {
            [self.delegate didAudioPlayerPausePlay:_audioPlayer];
        }
    }
}
/**
 *  停止播放
 */
- (void)stopAudio {
    self.pathName = @"";
    if (_audioPlayer && _audioPlayer.isPlaying) {
        [_audioPlayer stop];
    }
//    [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
    if ([self.delegate respondsToSelector:@selector(didAudioPlayerStopPlay:)]) {
        [self.delegate didAudioPlayerStopPlay:_audioPlayer];
    }
}

#pragma mark - AVAudioPlayer播放结束代理方法
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if(flag){
        //响应播放结束方法
        if ([self.delegate respondsToSelector:@selector(didAudioPlayerFinishPlay:)]) {
            [self.delegate didAudioPlayerFinishPlay:_audioPlayer];
        }
    }
}

//设置协议代理
- (void)setDelegate:(id<WBAudioPlayerHelperDelegate>)delegate {
    if (_delegate != delegate) {
        _delegate = delegate;
        
        if (_delegate == nil) {
            [self stopAudio];
        }
    }
}

#pragma mark - Setter Getter方法
- (AVAudioPlayer *)getAudioPlayer:(NSString *)path withStype:(WBAudioFileTyle)type{
    NSURL *fileURL;
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        // 处理耗时操作的代码块...
//
//        //通知主线程刷新
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //回调或者说是通知主线程刷新，
//        });
//
//    });
    
    if (type == WBAudioFileTyle_Network) {
        //根据网络url生产NSData
        NSURL *url = [[NSURL alloc]initWithString:path];
        NSData *audioData = [NSData dataWithContentsOfURL:url];
        
        //将数据保存到本地指定位置Caches
        NSString *dirPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *filePath = [NSString stringWithFormat:@"%@/%@",dirPath,@"audio.caf"];
        [audioData writeToFile:filePath atomically:YES];
        
        fileURL = [NSURL fileURLWithPath:filePath];
    }else if (type == WBAudioFileTyle_Local){
        fileURL = [NSURL URLWithString:path];
    }
    
    //初始化播放器并播放
    NSError *error;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
    player.delegate = self;
    [player prepareToPlay];
    if(error){
        NSLog(@"file error %@",error.description);
    }
    return player;
}

#pragma mark - Setter Getter方法
-(void)getOneAudioPlayer:(NSString *)path withStype:(WBAudioFileTyle)type{
//    NSURL *fileURL;
    __block NSURL *fileURL;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            // 处理耗时操作的代码块...
            if (type == WBAudioFileTyle_Network) {
                //根据网络url生产NSData
                NSURL *url = [[NSURL alloc]initWithString:path];
                NSData *audioData = [NSData dataWithContentsOfURL:url];
                
                //将数据保存到本地指定位置Caches
                NSString *dirPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSString *filePath = [NSString stringWithFormat:@"%@/%@",dirPath,@"audio.caf"];
                [audioData writeToFile:filePath atomically:YES];
                
                fileURL = [NSURL fileURLWithPath:filePath];
            }else if (type == WBAudioFileTyle_Local){
                fileURL =  [[NSBundle mainBundle]URLForResource:path withExtension:@""];
               
            }
            //通知主线程刷新
            dispatch_async(dispatch_get_main_queue(), ^{
                //回调或者说是通知主线程刷新，
                //初始化播放器并播放
                NSError *error;
                AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
                player.delegate = self;
                [player prepareToPlay];
                if(error){
                    //NSLog(@"file error %@",error.description);
                }
                self.audioPlayer = player;
                [self playAudio];
            });
        });
}


// 删除保存的音频文件
-(void)deleteFile{
    NSString *dirPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",dirPath,@"audio.caf"];
    BOOL blHave = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (!blHave) {
        NSLog(@"没有文件");
        return ;
    }else {
        BOOL blDele= [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        if (blDele) {
            NSLog(@"删除成功");
            [self stopAudio];
        }else {
            NSLog(@"删除失败");
        }
    }
}

@end

