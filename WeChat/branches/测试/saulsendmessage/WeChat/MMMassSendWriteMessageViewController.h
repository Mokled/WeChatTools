//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//


@interface MMMassSendWriteMessageViewController : UIViewController

- (_Bool)ShouldShowKeyboardAnimation;
- (void)initAllowRecommendApp;
- (void)initAllowWxTalk;
- (void)initAllowVoiceInput;
- (void)initAllowVoip;
- (void)willDisappear;
- (void)PopBack;
- (void)OnMassSendOK;
- (void)OnMassSendFail:(unsigned int)arg1 WithErrorMsg:(id)arg2;
- (void)stopLoadingAndShowError:(id)arg1 withDelay:(double)arg2;
- (void)touchesBegan_TableView:(id)arg1 withEvent:(id)arg2;
- (id)GetContactName;
- (struct CGPoint)CheckVoiceBtnPressLocation;
- (unsigned int)CheckVoiceBtnState;
- (void)SetPeakPower:(float)arg1;
- (void)ShowTooLongTips;
- (void)ShowTooShortTips;
- (void)SetVoiceEnabled:(_Bool)arg1;
- (void)HideRecordTips;
- (void)ShowRecording;
- (_Bool)CanSendVideoMsg;
- (_Bool)CanSendOriginalImage;
- (_Bool)CanSendMultiImage;
- (id)getNavigationController;
- (id)getViewController;
- (void)CameraControllerDidTakeSightImage:(id)arg1 withFrontCamera:(_Bool)arg2;
- (void)CameraControllerDidTakeSightWithVideoInfo:(id)arg1;
- (void)CameraControllerDidTakeVideo:(id)arg1;
- (void)processInsertedImage:(id)arg1 withData:(id)arg2 ImageInfo:(id)arg3;
- (void)processInsertedImage:(id)arg1 ImageInfo:(id)arg2;
- (void)actionSheet:(id)arg1 clickedButtonAtIndex:(long long)arg2;
- (void)onAddApp;
- (void)openServiceAppListController;
- (void)openMyFavoritesListController;
- (void)onShareAppMsg:(id)arg1;
- (void)openCameraController;
- (void)openNewMediaBrowser:(id)arg1;
- (void)openMediaBrowser;
- (void)hideToolViewAnimated:(_Bool)arg1;
- (void)CancelRecording;
- (void)StopRecording;
- (void)SendRecording;
- (void)StartRecording;
- (void)onSelectLocation;
- (void)onVoipInvite;
- (void)onWXTalk;
- (void)onShareCard;
- (void)SendEmoticonMesssageToolView:(id)arg1;
- (void)SendEmojiArtMessageToolView:(id)arg1;
- (void)SendTextMessageToolView:(id)arg1;
- (void)onPositionModeChangeTo:(int)arg1 Animated:(_Bool)arg2;
- (void)ToolViewPositionDidChanged:(_Bool)arg1 animated:(_Bool)arg2;
- (id)GetCurrentViewController;
- (void)scrollViewWillBeginDragging:(id)arg1;
- (long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2;
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (void)initLoadingView;
- (void)initReceiverView;
- (void)viewDidLayoutSubviews;
- (void)adjustSubviewRects;
- (void)initToolView;
- (void)initTableView;
- (void)MassSend:(id)arg1;
- (void)ShowAlert;
- (id)getAllUsrName;
- (void)onBack:(id)arg1;
- (void)viewDidLoad;
- (void)dealloc;
- (id)init;


@end

