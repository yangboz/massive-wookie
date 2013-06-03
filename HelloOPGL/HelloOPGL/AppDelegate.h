//
//  AppDelegate.h
//  HelloOPGL
//
//  Created by zhou Yangbo on 13-6-3.
//  Copyright (c) 2013年 GODPAPER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenGLView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    OpenGLView *_glView;
}

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,retain) IBOutlet OpenGLView *glView; 

@end
