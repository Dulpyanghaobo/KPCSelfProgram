//
//  main.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/11.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

/*
    1.创建UIApplication(1.打开网页,发短信,打电话 2.设置应用程序提醒数字 3.设置联网状态 4.设置状态栏)
    2.创建AppDelegate代理对象,并且成为UIApplication代理,(监听整个app生命周期,处理内存警告)
    3.开启主运行循环,保证程序一直运行(runloop:每一个线程都有runloop,主线程有一个runloop自动开启)
    4.加载info.plist,判断是否指定了main.storyboard,如果指定,就会去加载
 
    1.创建窗口
    2.设置根控制器
    3.显示窗口
 */
