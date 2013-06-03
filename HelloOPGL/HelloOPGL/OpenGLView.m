//
//  OpenGLView.m
//  HelloOPGL
//
//  Created by zhou Yangbo on 13-6-3.
//  Copyright (c) 2013年 GODPAPER. All rights reserved.
//

#import "OpenGLView.h"

@implementation OpenGLView
//Wrapup code in OpenGLView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupLayer];
        [self setupContext];
        [self setupRenderBuffer];
        [self setupFrameBuffer];
        [self render];
    }
    return self;
}
//Replace dealloc method with this
-(void)dealloc
{
    [_context release];
    _context = nil;
    [super dealloc];
}
//Set layer class to CAEAGLayer.
+(Class)layerClass
{
    return [CAEAGLLayer class];
}
//Set layer to opaque
-(void)setupLayer
{
    _eagLayer = (CAEAGLLayer *)self.layer;
    _eagLayer.opaque = YES;
}
//Create OpenGL context
-(void)setupContext
{
    EAGLRenderingAPI api = kEAGLRenderingAPIOpenGLES2;
    _context = [[EAGLContext alloc] initWithAPI:api];
    if (!_context) {
        NSLog(@"Failed to initialize OPGLES 2.0 context");
        exit(1);
    }
    if (![EAGLContext setCurrentContext:_context]) {
        NSLog(@"Failed to set current OpenGL context!");
        exit(1);
    }
}
//Create a render buffer
-(void)setupRenderBuffer
{
    glGenRenderbuffers(1, &_colorRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:_eagLayer];
}
//Create a frame buffer
-(void)setupFrameBuffer
{
    GLuint framebuffer;
    glGenRenderbuffers(1, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer);
}
//Clear the screen
-(void)render
{
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    [_context presentRenderbuffer:GL_RENDERBUFFER];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
