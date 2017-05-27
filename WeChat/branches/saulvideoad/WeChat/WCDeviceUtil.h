//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@interface WCDeviceUtil : NSObject

+ (unsigned int)getUploadStepBeginTime;
+ (id)deviceFromHardDevice:(id)arg1 DeviceAttr:(id)arg2;
+ (id)displayNameFromDevice:(id)arg1;
+ (_Bool)isInternalSportBrand:(id)arg1;
+ (id)parseDeviceLikeMessageXML:(id)arg1;
+ (id)parseDeviceRankMessageXML:(id)arg1;
+ (struct AccessoryCmd *)deepCopyAccessoryCmd:(struct AccessoryCmd *)arg1;
+ (_Bool)parseConnectProto:(id)arg1:(id)arg2;
+ (unsigned int)hashString:(id)arg1;
+ (_Bool)saveDeviceBoundRelationshipVersion:(unsigned int)arg1;
+ (unsigned int)getDeviceBoundRelationshipVersion;
+ (void)addLocalMessage:(id)arg1 MessageContent:(id)arg2;
+ (id)getLocalMessage:(id)arg1;
+ (long long)genTaskId;
+ (id)parseWCDeviceMsg:(id)arg1;

@end

