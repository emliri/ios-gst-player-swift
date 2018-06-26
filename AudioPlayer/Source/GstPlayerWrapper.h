//
//  GstPlayerWrapper.h
//  AudioPlayer
//
//  Created by Stephan on 26.06.18.
//  Copyright © 2018 Blinkist. All rights reserved.
//

#ifndef GstPlayerWrapper_h
#define GstPlayerWrapper_h

void GstPlayerInit();

void* GstPlayerCreate(void
                      positionCallback (void *player,
                                            long arg1,
                                            void *data), void* userData);

void GstPlayerSetUri(void* player, const char *uri);

void GstPlayerPlay(void* player);

void GstPlayerSeek(void* player, int milliseconds);

#endif /* GstPlayerWrapper_h */
