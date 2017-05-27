#import "WeChat/ContactInfoViewController.h"
#import "WeChat/WCTimeLineFooterView.h"
#import "WeChat/WCListViewController.h"
#import "WeChat/WeixinContactInfoAssist.h"
#import "WeChat/CBaseContactInfoAssist.h"
#import "WeChat/ContactsViewController.h"
#import "WeChat/ContactSettingViewController.h"
#import "WeChat/ChatRoomInfoViewController.h"
#import "WeChat/ContactsDataLogic.h"
#import "WeChat/CBaseContact.h"
#import "WeChat/CContact.h"
#import "WeChat/CSetting.h"
#import "SaulWeChatPublicClass.h"
#import "WeChat/MMTabBarController.h"

SaulWeChatPublicClass * saulClass;
NSString * removeFriendNumberKey;
NSDictionary* dic2;
%hook MMTabBarController
- (void)viewDidLoad {
%orig;

    UILabel * label = [[UILabel alloc] init];
    label.frame = CGRectMake(160, 20, 70, 30);
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"删除好友 →";
    [self.view addSubview:label];

    UISwitch *switch1 = [[UISwitch alloc]init];
    switch1.frame = CGRectMake(230, 20, 0, 0);
    [switch1 setOn:NO];
    [switch1 addTarget:self action:@selector(switchIsRemoveFriendChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switch1];
}

%new
-(void)switchIsRemoveFriendChanged:(UISwitch *)swith {
    if ([swith isOn]){
        [SaulWeChatPublicClass sharedInstance].isRemoveFriend = YES;
    } else {
        [SaulWeChatPublicClass sharedInstance].isRemoveFriend = NO;
    }
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"removeFriendNumberList.plist"];
    dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];
    if (dic2) {
        if ([dic2 objectForKey:removeFriendNumberKey]) {
            [SaulWeChatPublicClass sharedInstance].dataNumber = [[dic2 objectForKey:removeFriendNumberKey] integerValue];
        } else {
            [SaulWeChatPublicClass sharedInstance].dataNumber = 0;
        }
    } else {
        [SaulWeChatPublicClass sharedInstance].dataNumber = 0;
    }
    NSLog(@"\n\n\n\n\n\n\n\n\n\n\n %lld",(long long)[SaulWeChatPublicClass sharedInstance].dataNumber);
}

%end

%hook ContactsViewController
- (void)viewWillAppear:(_Bool)arg1 {
%orig;

    if (![SaulWeChatPublicClass sharedInstance].isRemoveFriend) {
        return;
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        NSMutableArray * array = [[NSMutableArray alloc] init];
        Ivar mDelegateVar = class_getInstanceVariable(objc_getClass("ContactsViewController"), "m_contactsDataLogic");
        ContactsDataLogic * mDelegate = object_getIvar(self, mDelegateVar);
        array = [mDelegate getAllContacts];




        if (saulClass.dataNumber < array.count) {
            CBaseContact * contact = array[saulClass.dataNumber];
            NSLog(@"\n %@ \n %@ \n %lld \n ↑",[contact getContactTalkRoomName],contact,(long long)saulClass.dataNumber);
            NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
            NSString *path=[paths objectAtIndex:0];
            NSString *filename=[path stringByAppendingPathComponent:@"removeFriendNumberList.plist"];
            NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%lld",(long long)saulClass.dataNumber],removeFriendNumberKey,nil];
            [dic writeToFile:filename atomically:YES];
            saulClass.dataNumber++;

            [self showContactInfoView:contact];

        } else{
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"完事儿" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"okay",nil];
            [alert show];
            saulClass.dataNumber = 0;
            NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
            NSString *path=[paths objectAtIndex:0];
            NSString *filename=[path stringByAppendingPathComponent:@"removeFriendNumberList.plist"];
            NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%lld",(long long)saulClass.dataNumber],removeFriendNumberKey,nil];
            [dic writeToFile:filename atomically:YES];
        }

    });
}

%end

%hook ContactSettingViewController
- (void)viewDidLoad {
 %orig;

    if (![SaulWeChatPublicClass sharedInstance].isRemoveFriend) {
        return ;
    }

    if (saulClass.isCheckDone) {
        if (saulClass.isNotFriend) { // 不是好友
            saulClass.dataNumber--;
            saulClass.isNotFriend = NO;
            [self doDelete];
        }
    }

}
%end

%hook ChatRoomInfoViewController
- (void)viewDidLoad
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        saulClass.isCheckDone = NO;
        [self.navigationController popViewControllerAnimated:YES];

    });
}
%end

%hook ContactInfoViewController
- (void)viewWillAppear:(BOOL)arg1 {
%orig;

    if (![SaulWeChatPublicClass sharedInstance].isRemoveFriend) {
        return;
    }

    if (!saulClass) {
        saulClass = [SaulWeChatPublicClass sharedInstance];
    }
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

    if (saulClass.isCheckDone) {
        if (!saulClass.isNotFriend) {
            saulClass.isCheckDone = NO;
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            Ivar mDelegateVar = class_getInstanceVariable(objc_getClass("ContactInfoViewController"), "m_oContactInfoAssist");
            CBaseContactInfoAssist * mDelegate = object_getIvar(self, mDelegateVar);
            [mDelegate onAction];
            NSLog(@"\n 不是好友");
        }
    } else {
        Ivar mDelegateVar = class_getInstanceVariable(objc_getClass("ContactInfoViewController"), "m_oContactInfoAssist");
        CBaseContactInfoAssist * mDelegate = object_getIvar(self, mDelegateVar);


        Ivar mDelegateVar1 = class_getInstanceVariable(objc_getClass("ContactInfoViewController"), "m_contact");
        CContact * mDelegate1 = object_getIvar(self, mDelegateVar1);
        if ([mDelegate1 isBrandContact]) {
            saulClass.isCheckDone = NO;
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [mDelegate showAlbumList];
        }


    }
});
}

%end

%hook WCListViewController // 判断是否是好友
- (void)viewDidLoad {
%orig;

    if (![SaulWeChatPublicClass sharedInstance].isRemoveFriend) {
        return;
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        saulClass.isCheckDone = YES;
        [self onDissmiss];
    });
}

%end

%hook WCTimeLineFooterView

- (id)initWithFrame:(struct CGRect)arg1 {
id orig = %orig;

    if (![SaulWeChatPublicClass sharedInstance].isRemoveFriend) {
        return orig;
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self onClick];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        Ivar mDelegateVar = class_getInstanceVariable(objc_getClass("WCTimeLineFooterView"), "m_label");
        UILabel * mDelegate = object_getIvar(self, mDelegateVar);
        if ([mDelegate.text isEqualToString:@"非对方的朋友只显示最多十张照片"]) {
            saulClass.isNotFriend = YES;
        }
    });

return orig;
}

%end

%hook CSetting
- (id)initWithCoder:(id)arg1
{
id orig = %orig;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        Ivar mDelegateVar = class_getInstanceVariable(objc_getClass("CSetting"), "m_nsAliasName");
        NSString * mDelegate = object_getIvar(self, mDelegateVar);
        removeFriendNumberKey = mDelegate;
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *path=[paths objectAtIndex:0];
        NSString *filename=[path stringByAppendingPathComponent:@"removeFriendNumberList.plist"];
        dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];
        if(dic2 == nil) {
            NSFileManager* fm = [NSFileManager defaultManager];
            [fm createFileAtPath:filename contents:nil attributes:nil];
            NSDictionary* dd = [NSDictionary dictionaryWithObjectsAndKeys:@"0",removeFriendNumberKey,nil]; //写入数据
            [dd writeToFile:filename atomically:YES];
        }
    });
return orig;
}

- (void)preInit
{
%orig;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        Ivar mDelegateVar = class_getInstanceVariable(objc_getClass("CSetting"), "m_nsAliasName");
        NSString * mDelegate = object_getIvar(self, mDelegateVar);
        removeFriendNumberKey = mDelegate;

        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *path=[paths objectAtIndex:0];
        NSString *filename=[path stringByAppendingPathComponent:@"removeFriendNumberList.plist"];
        dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];
        if(dic2 == nil) {
            NSFileManager* fm = [NSFileManager defaultManager];
            [fm createFileAtPath:filename contents:nil attributes:nil];

            NSDictionary* dd = [NSDictionary dictionaryWithObjectsAndKeys:@"0",removeFriendNumberKey,nil]; //写入数据
            [dd writeToFile:filename atomically:YES];
        }
    });
}

%end
