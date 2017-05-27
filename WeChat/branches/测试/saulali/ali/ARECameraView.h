//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface ARECameraView : UIView


- (void)applicationEnterBackground;
- (void)applicationEnterForground;
- (id)deviceWithMediaType:(id)arg1 preferringPosition:(long long)arg2;
- (id)initWithDelegate:(id)arg1 mode:(unsigned long long)arg2;
- (void)layoutSubviews;
- (void)onARTargetLost:(id)arg1 info:(id)arg2;
- (void)onARTargetMatch:(id)arg1 info:(id)arg2;
- (void)onARTargetMoveFast;
- (void)onARTargetNotFitToHide;
- (void)pauseRunning;
- (void)registerNotifications;
- (void)renderViewDidRenderFirstFrame:(id)arg1;
- (void)requestCameraAuthorization;
- (void)resumeRunning;
- (void)setupCamera;
- (void)showLoadError;
- (void)showMaskInRect:(struct CGRect)arg1;
- (void)startCameraRunning;
- (void)startLoading;
- (void)startRunning;
- (void)stopLoading;
- (void)stopRunning;
- (long long)torchMode;
- (void)turnTorchOff;
- (void)turnTorchOn;
- (void)updateFeatures:(id)arg1;
- (void)willMoveToSuperview:(id)arg1;

@end

