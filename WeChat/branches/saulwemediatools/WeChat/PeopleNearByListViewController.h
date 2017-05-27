//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface PeopleNearByListViewController : UIViewController



- (void)adjustSubviewRects;
- (void)checkBannerLogic;
- (void)createBannerBtn;
- (void)dealloc;
- (id)genLBSPeopleCell:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (id)genLBSPoiCell:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (id)getCachedHeaderImageForUser:(id)arg1;
- (id)init;
- (_Bool)isLBSPeopleIndex:(id)arg1;
- (long long)numberOfSectionsInTableView:(id)arg1;
- (void)onChatRoomNearByBtnClicked;
- (void)reloadWithLbsContactInfoList:(id)arg1;
- (void)reloadWithLbsPoiList:(id)arg1;
- (void)setDelegate:(id)arg1;
- (void)showChatRoomView;
- (void)startBindPhone;
- (void)startBindQQ;
- (void)startUploadAddressbook;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2;
- (void)viewDidAppear:(_Bool)arg1;
- (void)viewDidDisappear:(_Bool)arg1;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewWillAppear:(_Bool)arg1;
- (void)viewWillDisappear:(_Bool)arg1;


@end

