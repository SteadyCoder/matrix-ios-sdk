/*
 Copyright 2015 OpenMarket Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXCall.h"

#import "MXSession.h"

@interface MXCall ()
{
    /**
     The manager of this object.
     */
    MXCallManager *callManager;
}

@end

@implementation MXCall

- (instancetype)initWithEvent:(MXEvent *)event andCallManager:(MXCallManager *)callManager2
{
    self = [super init];
    if (self)
    {
        NSParameterAssert(event.eventType == MXEventTypeCallInvite);

        callManager = callManager2;

        MXCallInviteEventContent *inviteContent = [MXCallInviteEventContent modelFromJSON:event.content];

        _room = [callManager.mxSession roomWithRoomId:event.roomId];
        _callId = inviteContent.callId;
    }
    return self;
}

@end
