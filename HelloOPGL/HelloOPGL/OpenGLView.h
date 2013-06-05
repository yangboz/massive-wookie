//
//  OpenGLView.h
//  HelloOPGL
//
//  Created by zhou Yangbo on 13-6-3.
//  Copyright (c) 2013年 GODPAPER. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>



@interface OpenGLView : UIView
{
    CAEAGLLayer *_eagLayer;
    EAGLContext *_context;
    GLuint _colorRenderBuffer;
    //Vertex and Fragment
    GLuint _positionSlot;
    GLuint _colorSlot;
}
@end
