//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//


@interface MMMassSendContactSelectorViewController : UIViewController

@property(retain, nonatomic) NSMutableSet *setSelectedContacts; // @synthesize setSelectedContacts=_setSelectedContacts;


- (void)willShow;
- (void)onTopBarFrameChanged;
- (void)onDone:(id)arg1;
- (void)onDeSelectAll:(id)arg1;
- (void)onSelectAll:(id)arg1;
- (void)searchBarTextDidBeginEditing:(id)arg1;
- (void)searchBar:(id)arg1 textDidChange:(id)arg2;
- (void)doSearch:(id)arg1;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)sectionIndexTitlesForTableView:(id)arg1;
- (id)tableView:(id)arg1 viewForHeaderInSection:(long long)arg2;
- (id)tableView:(id)arg1 titleForHeaderInSection:(long long)arg2;
- (long long)numberOfSectionsInTableView:(id)arg1;
- (long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2;
- (double)tableView:(id)arg1 heightForHeaderInSection:(long long)arg2;
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (void)makeCell:(id)arg1 tableCell:(id)arg2 section:(unsigned long long)arg3 row:(unsigned long long)arg4;
- (void)searchDisplayController:(id)arg1 didHideSearchResultsTableView:(id)arg2;
- (void)searchDisplayController:(id)arg1 didShowSearchResultsTableView:(id)arg2;
- (void)initToolView;
- (void)initSearchBar;
- (void)initTableView;
- (id)getRightBarButton:(_Bool)arg1;
- (void)initView;
- (void)initData;
- (id)parseContactKey:(id)arg1;
- (void)processContact:(id)arg1;
- (void)showAlertTooMany;
- (void)viewDidLoad;
- (void)dealloc;
- (id)init;



@end

