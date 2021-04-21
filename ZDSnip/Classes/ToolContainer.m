//
//  ToolContainer.m
//  Snip
//
//  Created by isee15 on 15/2/5.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "ToolContainer.h"
#import "SnipUtil.h"

@interface ToolContainer ()
@property ImageButton *rectButton;
@property ImageButton *ellipseButton;
@property ImageButton *arrowButton;
@property ImageButton *textButton;
@property ImageButton *penButton;
@property ImageButton *cancelButton;
@property ImageButton *okButton;

@property NSImage *rectIcon;
@property NSImage *ellipseIcon;
@property NSImage *arrowIcon;
@property NSImage *textIcon;
@property NSImage *penIcon;
@property NSImage *cancelIcon;
@property NSImage *okIcon;

@property(nonatomic, copy) NSArray<ImageButton *> *tools;
@end

@implementation ToolContainer

- (instancetype)init
{
    if (self = [super init]) {
        NSData *rectData = [[[NSDataAsset alloc] initWithName:@"ScreenCapture_toolbar_rect_ineffect"] data];
        _rectIcon = [[NSImage alloc] initWithData:rectData];
        
        NSData *ellipseData = [[[NSDataAsset alloc] initWithName:@"ScreenCapture_toolbar_ellipse_ineffect"] data];
        _ellipseIcon = [[NSImage alloc] initWithData:ellipseData];
        
        NSData *arrowData = [[[NSDataAsset alloc] initWithName:@"ScreenCapture_toolbar_arrow_ineffect"] data];
        _arrowIcon = [[NSImage alloc] initWithData:arrowData];
        
        NSData *textData = [[[NSDataAsset alloc] initWithName:@"ScreenCapture_toolbar_text_ineffect"] data];
        _textIcon = [[NSImage alloc] initWithData:textData];
        
        NSData *penData = [[[NSDataAsset alloc] initWithName:@"ScreenCapture_toolbar_pen_ineffect"] data];
        _penIcon = [[NSImage alloc] initWithData:penData];
        
        NSData *cancelData = [[[NSDataAsset alloc] initWithName:@"ScreenCapture_toolbar_cross_normal"] data];
        _cancelIcon = [[NSImage alloc] initWithData:cancelData];
        
        NSData *okData = [[[NSDataAsset alloc] initWithName:@"ScreenCapture_toolbar_tick_normal"] data];
        _okIcon = [[NSImage alloc] initWithData:okData];
        
        _rectButton = [SnipUtil createButton:_rectIcon withAlternate:nil];
        _rectButton.tag = ActionShapeRect;

        _ellipseButton = [SnipUtil createButton:_ellipseIcon withAlternate:nil];
        _ellipseButton.tag = ActionShapeEllipse;

        _arrowButton = [SnipUtil createButton:_arrowIcon withAlternate:nil];
        _arrowButton.tag = ActionShapeArrow;

        _textButton = [SnipUtil createButton:_textIcon withAlternate:nil];
        _textButton.tag = ActionEditText;

        _penButton = [SnipUtil createButton:_penIcon withAlternate:nil];
        _penButton.tag = ActionEditPen;

        _cancelButton = [SnipUtil createButton:_cancelIcon withAlternate:nil];
        _cancelButton.tag = ActionCancel;

        _okButton = [SnipUtil createButton:_okIcon withAlternate:nil];
        _okButton.tag = ActionOK;

        _tools = @[_rectButton,_ellipseButton,_arrowButton,_penButton,_textButton,_cancelButton,_okButton];
        for (ImageButton *btn in _tools) {
            btn.target = self;
            btn.action = @selector(onToolClick:);
            [self addSubview:btn];
        }
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    NSBezierPath *bgPath = [NSBezierPath bezierPathWithRoundedRect:self.bounds xRadius:3 yRadius:3];
    [bgPath setClip];
    [[NSColor colorWithCalibratedWhite:1.0 alpha:0.3f] setFill];
    NSRectFill(self.bounds);
    // Drawing code here.
}

- (void)setFrame:(NSRect)frame
{
    [super setFrame:frame];
    int step = 35;
    int margin = 10;
    int index = 0;
    for (ImageButton *btn in self.tools) {
        [btn setFrame:NSMakeRect(margin+step * (index++), 0, 28, 26)];
    }
}

- (void)onToolClick:(NSControl *)sender
{
    //need refactor
    self.rectButton.image = _rectIcon;
    self.ellipseButton.image = _ellipseIcon;
    self.arrowButton.image = _arrowIcon;
    self.textButton.image = _textIcon;
    self.penButton.image = _penIcon;

    if (sender == self.rectButton) {
        self.rectButton.image = _rectIcon;
    }
    else if (sender == self.ellipseButton) {
        self.ellipseButton.image = _ellipseIcon;
    }
    else if (sender == self.arrowButton) {
        self.arrowButton.image = _arrowIcon;
    }
    else if (sender == self.textButton) {
        self.textButton.image = _textIcon;
    }
    else if (sender == self.penButton) {
        self.penButton.image = _penIcon;
    }
    if (self.toolClick) {
        self.toolClick([sender tag]);
    }
}

- (void)mouseDown:(NSEvent *)theEvent
{
}

@end
